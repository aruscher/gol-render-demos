(in-package #:gol-render-demos)


(defclass grid-window (gl-window)
  ((game-of-life :initarg :game-of-life :reader game-of-life)))

(defmethod close-window ((w grid-window))
 (print "Quit")
 (call-next-method))


(defmethod initialize-instance :after ((w grid-window) &key &allow-other-keys)
  (gl:viewport 0 0 800 600)
  (matrix-mode :projection)
  (load-identity)
  (ortho 0 800 600 0 2 -2)
  (clear-color 0 0 0 1)
  (setf (idle-render w) t)
  )

(defmethod render ((w grid-window))
  (clear :color-buffer-bit)
  (with-slots (rows cols) (game-of-life w)
      (let* ((height (window-height w))
             (width (window-width w))
             (cell-width (floor (/ width cols)))
             (cell-height (floor (/ height rows))))
        (with-primitives :quads
          (dotimes (row rows)
            (dotimes (col cols)
              (if (= (get-cell (game-of-life w) row col) 1)
                  (%gl:color-3f 1.0 1.0 1.0)
                  (%gl:color-3f 0.0 0.0 0.0))
              (vertex (* col cell-width) (* row cell-height)) ;; top-left
              (vertex (+ (* col cell-width) cell-width) (* row cell-height)) ;; top-righ
              (vertex (+ (* col cell-width) cell-width) (+ (* row cell-height) cell-height)) ;; down-right
              (vertex (* col cell-width) (+ (* row cell-height) cell-height))
              )))
        ))
  (update (game-of-life w)))



(define-start-function start-grid-view ()
  (sdl2:gl-set-attr :context-major-version 2)
  (sdl2:gl-set-attr :context-minor-version 1)
  (make-instance 'grid-window  :game-of-life (random-game-of-life 300 400)))

