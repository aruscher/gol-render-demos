(in-package #:sdl2kit)

(defclass sdl2kit-window (2d-window)
  ((game-of-life :initarg :game-of-life :reader game-of-life)))

(defmethod sdl2.kit:close-window ((w sdl2kit-window))
 (print "Quit")
 (call-next-method))

(defmethod initialize-instance :after ((w sdl2kit-window) &key &allow-other-keys)
  (setf (sdl2.kit:idle-render w) t))

(defmethod sdl2.kit:render ((w sdl2kit-window))
  (with-slots (rows cols) (game-of-life w)
    (let* ((height (sdl2.kit:window-height w))
           (width (sdl2.kit:window-width w))
           (cell-width (floor (/ width cols)))
           (cell-height (floor (/ height rows))))
      (dotimes (row rows)
          (dotimes (col cols)
            (let* ((top-left (list (* col cell-width) (* row cell-height)))
                  (rect (sdl2:make-rect (first top-left) (second top-left) cell-width cell-height)))
              (if (= (get-cell (game-of-life w) row col) 1)
                  (sdl2:set-render-draw-color (renderer w) 255 255 255 255)
                  (sdl2:set-render-draw-color (renderer w) 0 0 0 0))
              (sdl2:render-fill-rect (renderer w) rect)
              )))))

  (update (game-of-life w)))

(sdl2.kit:define-start-function start-sdl2kit ()
  (make-instance 'sdl2kit-window :game-of-life (random-game-of-life 300 400)))




