(in-package #:gol-render-demos)

(defclass game-of-life ()
  ((cols :initform 100 :initarg :cols :reader cols)
   (rows :initform 100 :initarg :rows :reader rows)
   (grid :initform nil :accessor grid)))

(defmethod initialize-instance :after ((game-of-life game-of-life) &key  &allow-other-keys)
  (with-slots (cols rows grid) game-of-life
    (setf grid (make-array (* rows cols) :initial-element 0))))

(defun size (game-of-life)
  (with-slots (cols rows) game-of-life
    (* cols rows)))

(defun random-game-of-life (&optional (rows 20) (cols 20))
  (let ((game-of-life (make-instance 'game-of-life :rows rows :cols cols)))
    (with-slots (grid) game-of-life
      (loop for i :from 0 :below (size game-of-life)
            :do (setf (aref grid i) (random 2))))
    game-of-life))

(defun get-neighbours (game-of-life row col)
  (let ((to-the-left (1- col))
        (to-the-right (1+ col))
        (to-the-top (1- row))
        (to-the-bottom (1+ row)))
    (remove-if #'null (list (get-cell game-of-life row to-the-left)
                            (get-cell game-of-life row to-the-right)
                            (get-cell game-of-life to-the-top col)
                            (get-cell game-of-life to-the-bottom col)
                            (get-cell game-of-life to-the-top to-the-left)
                            (get-cell game-of-life to-the-top to-the-right)
                            (get-cell game-of-life to-the-bottom to-the-left)
                            (get-cell game-of-life to-the-bottom to-the-right)))))

(defun get-cell (game-of-life row col)
  (if (or (< row 0) (< col 0) (> row (1- (rows game-of-life))) (> col (1- (cols game-of-life))))
      nil
      (aref (grid game-of-life) (game-of-life-index game-of-life row col))))

(defun game-of-life-index (game-of-life row col)
  (+ (* (cols game-of-life) row) col))

(defun update (game-of-life)
  (with-slots (cols rows grid) game-of-life
    (let ((new-grid (make-array (* cols rows))))
      (dotimes (row rows)
        (dotimes (col cols)
          (let* ((neighbours (get-neighbours game-of-life row col))
                 (n-sum (apply #'+ neighbours)))
            (setf (aref new-grid (game-of-life-index game-of-life row col))
                  (case (get-cell game-of-life row col)
                    (0 (if (= n-sum 3) 1 0))
                    (1 (cond
                         ((< n-sum 2) 0)
                         ((<= 2 n-sum 3) 1)
                         ((> n-sum 3) 0))))))))
      (setf grid new-grid))))

