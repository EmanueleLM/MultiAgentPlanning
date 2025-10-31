(define (problem build-stack-n-to-a)
  (:domain blocks-multiagent)
  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    ;; Initially every block is on the table and clear
    (ontable a) (clear a)
    (ontable b) (clear b)
    (ontable c) (clear c)
    (ontable d) (clear d)
    (ontable e) (clear e)
    (ontable f) (clear f)
    (ontable g) (clear g)
    (ontable h) (clear h)
    (ontable i) (clear i)
    (ontable j) (clear j)
    (ontable k) (clear k)
    (ontable l) (clear l)
    (ontable m) (clear m)
    (ontable n) (clear n)

    ;; single shared hand is initially empty
    (handempty)
  )

  (:goal (and
    ;; Desired final tower order (bottom to top): n, m, l, k, j, i, h, g, f, e, d, c, b, a
    (ontable n)
    (on m n)
    (on l m)
    (on k l)
    (on j k)
    (on i j)
    (on h i)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
  ))
)