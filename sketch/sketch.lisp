(in-package #:sketch-demo)

(defsketch game-of-life
    ((game-of-life (random-game-of-life 20 20))
     (width 800)
     (height 600))
  (with-slots (rows cols) game-of-life
    (let* ((cell-width (floor (/ width cols)))
           (cell-height (floor (/ height rows))))
      (dotimes (row rows)
        (dotimes (col cols)
          (let* ((top-left (list (* col cell-width) (* row cell-height))))
            ;; (if (= (get-cell game-of-life row col) 1)
            ;;     (sdl2:set-render-draw-color (renderer w) 255 255 255 255)
            ;;     (sdl2:set-render-draw-color (renderer w) 0 0 0 0))
            (rect (first top-left) (second top-left) cell-width cell-height))
          ))))
  (update game-of-life))
