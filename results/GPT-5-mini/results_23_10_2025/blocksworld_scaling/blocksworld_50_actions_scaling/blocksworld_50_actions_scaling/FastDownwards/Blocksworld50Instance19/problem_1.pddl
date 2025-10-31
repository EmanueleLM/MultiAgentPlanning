(define (problem blocksworld_final_check)
  (:domain blocksworld)
  (:objects
    a b c d e f g h i j k l m n - block
  )

  (:init
    ;; Initial configuration (from human specification)
    (on a h)
    (on b f)
    (ontable c)
    (on d c)
    (on e j)
    (on f l)
    (on g d)
    (ontable h)
    (on i n)
    (on j k)
    (on k a)
    (on l e)
    (on m g)
    (on n m)

    ;; Clear (tops) in the initial state
    (clear b)
    (clear i)

    ;; Agent is not holding anything initially
    (handempty)
  )

  ;; Goal: the final arrangement derived from executing the given action sequence
  (:goal
    (and
      (on a h)
      (on k j)
      (on j l)
      (on l e)
      (on e f)
      (on f b)
      (on b i)
      (on i n)
      (on n m)
      (on m g)
      (on g d)
      (on d c)
      (ontable c)
      (ontable h)
    )
  )
)