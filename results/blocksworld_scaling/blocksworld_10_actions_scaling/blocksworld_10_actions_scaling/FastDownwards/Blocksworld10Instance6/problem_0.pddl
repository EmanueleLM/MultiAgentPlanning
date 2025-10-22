(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    A B C D E F G - block
    mover1 mover2 mover_other - agent
  )

  ;; Initial state (as reported)
  (:init
    ;; on-place relationships
    (on A B)
    (on E A)
    (on D C)
    (on F G)

    ;; blocks on the table
    (on-table B)
    (on-table C)
    (on-table G)

    ;; clear/top-of-stack facts (initially nothing on top of E, D, F)
    (clear E)
    (clear D)
    (clear F)

    ;; agents are free-handed initially
    (handempty mover1)
    (handempty mover2)
    (handempty mover_other)
  )

  ;; Goal is the final arrangement after executing the reported action sequence:
  ;; 1. unstack(E,A)
  ;; 2. stack(E,D)
  ;; 3. unstack(E,D)
  ;; 4. stack(E,F)
  ;; 5. unstack(D,C)
  ;; 6. putdown(D)
  ;; 7. unstack(E,F)
  ;; 8. stack(E,F)
  ;; 9. unstack(E,F)
  ;; 10. putdown(E)
  ;; Derived final configuration:
  ;; A on B; B on table; E on table; C on table; D on table; F on G; G on table.
  (:goal
    (and
      (on A B)
      (on-table B)
      (on-table E)
      (on-table C)
      (on-table D)
      (on F G)
      (on-table G)
    )
  )
)