(in-package #:sdl2kit)

;; Code taken from https://github.com/lispgames/sdl2kit/pull/6
(defclass 2d-window (window)
  ((renderer :initform nil :reader renderer)))

(defmethod initialize-window progn ((window 2d-window) &key &allow-other-keys)
  (with-slots (renderer sdl-window) window
    (setf renderer (sdl2:create-renderer sdl-window))))

(defmethod render :before ((window 2d-window))
  (with-slots (renderer) window
    (sdl2-ffi.functions:sdl-render-clear renderer)))

(defmethod render :after ((window 2d-window))
  (with-slots (renderer) window
    (sdl2:render-present renderer)))

(defmethod close-window ((window 2d-window))
  (with-slots (renderer) window
    (when (and (slot-boundp window 'renderer) renderer)
      (sdl2:destroy-renderer renderer)))
  (call-next-method))
