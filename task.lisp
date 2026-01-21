(defun compute-f ()
  (let ((f (make-array 21)))
    (setf (aref f 1) 1.0)
    (setf (aref f 10) 1.0)

    ;; F_2 ... F_9
    (loop for i from 2 to 9 do
          (setf (aref f i)
                (/ (* 2 (sqrt (* (aref f (- i 1)) i))) 4)))

    ;; F_11 ... F_20
    (loop for i from 11 to 20 do
          (setf (aref f i)
                (- (aref f (- i 1))
                   (/ (log i) 8))))

    f))

(defun print-f ()
  (let ((f (compute-f)))
    (loop for i from 1 to 20 do
          (format t "F(~d) = ~f~%" i (aref f i)))))
