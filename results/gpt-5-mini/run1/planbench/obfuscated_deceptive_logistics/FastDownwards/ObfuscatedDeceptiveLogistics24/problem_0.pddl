(define (problem assembly-problem)
  (:domain assembly)

  (:objects
    alice bob - agent
    prepare assemble test - task
    day1 day2 day3 - phase
  )

  (:init
    ;; category facts (explicit)
    (agent alice)
    (agent bob)
    (task prepare)
    (task assemble)
    (task test)
    (phase day1)
    (phase day2)
    (phase day3)

    ;; initial phase availability (all phases start free)
    (phase-free day1)
    (phase-free day2)
    (phase-free day3)

    ;; explicit ordered phases (contiguity enforced by using phase-next)
    (phase-first day1)
    (phase-second day2)
    (phase-third day3)
    (phase-next day1 day2)
    (phase-next day2 day3)

    ;; agent availability per phase (hard constraints)
    ;; Alice is available in day1 and day3; Bob is available in day2.
    (agent-available alice day1)
    (agent-available alice day3)
    (agent-available bob day2)
  )

  ;; Goal: all tasks must be completed and the phase-use ordering is enforced
  ;; implicitly by action preconditions (prepare in first phase, assemble in
  ;; successor, test in successor).
  (:goal
    (and
      (task-completed prepare)
      (task-completed assemble)
      (task-completed test)
    )
  )
)