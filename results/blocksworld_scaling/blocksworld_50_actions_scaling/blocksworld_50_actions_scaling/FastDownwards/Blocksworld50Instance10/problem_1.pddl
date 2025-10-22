(define (problem Blocksworld50Instance10)
  (:domain blocks-multiagent)

  (:objects
    a b c d e f g h i j - block
    table - place
    robot_1 robot_2 - robot
  )

  (:init
    ; Initial placement (from the specification)
    (on a b)
    (on b j)
    (on j d)
    (on d e)
    (on e table)

    (on c f)
    (on f h)
    (on h g)
    (on g table)

    (on i a)

    ; Clear predicates: top blocks initially are i and c
    (clear i)
    (clear c)

    ; Robots start with empty hands
    (handempty robot_1)
    (handempty robot_2)
  )

  (:goal (and
    ; Final arrangement derived from executing the action sequence
    (on e table)
    (on d e)
    (on j d)
    (on b j)
    (on a b)
    (on i a)

    (on h table)
    (on c h)
    (on f c)
    (on g f)
  ))
)