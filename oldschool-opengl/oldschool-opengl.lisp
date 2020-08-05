(in-package #:oldschool-opengl)

(defclass oldschool-opengl-window (sdl2.kit:gl-window)
  ((game-of-life :initarg :game-of-life :reader game-of-life)))

(defmethod sdl2.kit:close-window ((w oldschool-opengl-window))
 (print "Quit")
 (call-next-method))

(defmethod initialize-instance :after ((w oldschool-opengl-window) &key &allow-other-keys)
  (gl:viewport 0 0 800 600)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (gl:ortho 0 800 600 0 2 -2)
  (gl:clear-color 0 0 0 1)
  (setf (sdl2.kit:idle-render w) t))

(defmethod sdl2.kit:render ((w oldschool-opengl-window))
  (gl:clear :color-buffer-bit)
  (with-slots (rows cols) (game-of-life w)
      (let* ((height (sdl2.kit:window-height w))
             (width (sdl2.kit:window-width w))
             (cell-width (floor (/ width cols)))
             (cell-height (floor (/ height rows))))
        (gl:with-primitives :quads
          (dotimes (row rows)
            (dotimes (col cols)
              (if (= (get-cell (game-of-life w) row col) 1)
                  (%gl:color-3f 1.0 1.0 1.0)
                  (%gl:color-3f 0.0 0.0 0.0))
              (gl:vertex (* col cell-width) (* row cell-height)) ;; top-left
              (gl:vertex (+ (* col cell-width) cell-width) (* row cell-height)) ;; top-righ
              (gl:vertex (+ (* col cell-width) cell-width) (+ (* row cell-height) cell-height)) ;; down-right
              (gl:vertex (* col cell-width) (+ (* row cell-height) cell-height))
              )))
        ))
  (update (game-of-life w)))

(sdl2.kit:define-start-function start-oldschool-opengl ()
  (sdl2:gl-set-attr :context-major-version 2)
  (sdl2:gl-set-attr :context-minor-version 1)
  (make-instance 'oldschool-opengl-window :game-of-life (random-game-of-life 200 200)))




