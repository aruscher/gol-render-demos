;;;; package.lisp
(defpackage #:gol-render-demos.game
  (:nicknames #:game)
  (:use #:cl)
  (:export
   #:game-of-life
   #:cols
   #:rows
   #:grid
   #:size
   #:random-game-of-life
   #:get-cell
   #:update))
