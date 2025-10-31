(define (problem blocks-final)
  (:domain blocks)
  (:objects
    a b c d e f g h i j - block
  )

  ;; Initial state corresponds to the observed initial configuration
  (:init
    ;; direct relations (initial)
    (on a j)
    (ontable b)
    (ontable c)
    (on d c)
    (on e b)
    (on f i)
    (on g f)
    (on h d)
    (on i h)
    (on j e)

    ;; clearance and hand state initially
    (clear a)
    (clear g)
    (handempty)
  )

  ;; Goal: the final direct-location facts as observed and reconciled
  (:goal (and
    (on a e)
    (on b j)
    (on d c)
    (on e f)
    (on f i)
    (on h d)
    (on i h)
    (ontable c)
    (ontable g)
    (ontable j)
  ))
)