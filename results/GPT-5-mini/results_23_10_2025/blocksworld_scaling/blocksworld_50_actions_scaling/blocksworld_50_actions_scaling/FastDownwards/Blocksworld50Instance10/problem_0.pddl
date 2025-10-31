(define (problem blocks-problem)
  (:domain blocks-multiagent)

  (:objects
    a b c - block
    table - place
    r1 r2 - robot
  )

  (:init
    ; Initial placement (public information / agent reports)
    (on a table)
    (on b a)
    (on c table)

    ; Clear predicates derived from placement
    (clear b)
    (clear c)
    ; 'a' is not clear because b is on a (omitted => false)

    ; Both robots start with empty hands (available)
    (handempty r1)
    (handempty r2)
  )

  (:goal (and
    ; Final arrangement (derived final arrangement / public information)
    (on a b)
    (on b c)
    (on c table)
  ))
)