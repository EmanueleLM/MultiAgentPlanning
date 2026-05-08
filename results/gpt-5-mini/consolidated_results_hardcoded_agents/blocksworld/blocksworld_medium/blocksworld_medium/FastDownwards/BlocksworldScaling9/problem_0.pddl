(define (problem bw-orchestrated-problem-1)
  (:domain blocksworld-orchestrated)

  (:objects
    a b c - block
    table - place
  )

  (:init
    ;; Initial configuration:
    ;; b is on a, a is on the table, c is on the table.
    (on b a)
    (on a table)
    (on c table)

    ;; Topality (blocks that have nothing on them)
    (clear b)
    (clear c)
    ;; a is not clear because b is on a (no explicit (not (clear a)) is required in PDDL init;
    ;; absence of (clear a) implicitly means it is not true.)

    ;; Single hand is free at start
    (handempty)
  )

  ;; Goal fixes the mandated terminal configuration exactly.
  ;; - b must be on the table
  ;; - c must be stacked on b
  ;; - a must be on the table
  ;; - the manipulator must be empty (handempty) at the end
  (:goal (and
    (on b table)
    (on c b)
    (on a table)
    (handempty)
  ))
)