(define (pi n . args)
  (let* ((d (car args))
	 (r (do ((s 1 (* 10 s))
		 (i d (- i 1)))
		((zero? i) s)))
	 (n (+ (quotient n d) 1))
	 (m (quotient (* n d 3322) 1000))
	 (a (make-vector (+ 1 m) 2)))
    (vector-set! a m 4)
    (do ((j 1 (+ 1 j))
	 (q 0 0)
	 (b 2 (remainder q r)))
	((> j n))
      (do ((k m (- k 1)))
	  ((zero? k))
	(set! q (+ q (* (vector-ref a k) r)))
	(let ((t (+ 1 (* 2 k))))
	  (vector-set! a k (remainder q t))
	  (set! q (* k (quotient q t)))))
      (let ((s (number->string (+ b (quotient q r)))))
	(do ((l (string-length s) (+ 1 l)))
	    ((>= l d) (display s))
	  (display #\0)))
      (if (zero? (modulo j 10)) (newline) (display #\ )))
    (newline)))

(pi 300 5)