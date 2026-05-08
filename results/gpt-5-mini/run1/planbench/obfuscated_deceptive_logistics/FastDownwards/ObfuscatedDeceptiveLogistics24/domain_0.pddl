(define (domain assembly)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task phase)

  (:predicates
    ;; object-category predicates (explicit to allow use in preconditions)
    (agent ?a - agent)
    (task ?t - task)
    (phase ?p - phase)

    ;; availability and phase bookkeeping
    (agent-available ?a - agent ?p - phase)
    (phase-free ?p - phase)

    ;; explicit ordering of phases
    (phase-next ?p1 - phase ?p2 - phase)
    (phase-first ?p - phase)
    (phase-second ?p - phase)
    (phase-third ?p - phase)

    ;; task progress
    (task-performed-in ?t - task ?p - phase)
    (task-completed ?t - task)
  )

  ;; Action: Alice performs the "prepare" task in the first phase.
  ;; Preconditions:
  ;;   - the chosen phase must be the first phase and free,
  ;;   - Alice must be available in that phase,
  ;;   - the prepare task must exist and not already be completed.
  ;; Effects:
  ;;   - record that prepare was performed in that phase and mark it completed,
  ;;   - consume (mark non-free) the phase.
  (:action alice-perform-prepare
    :parameters (?p - phase)
    :precondition (and
      (agent alice)
      (task prepare)
      (phase ?p)
      (phase-first ?p)
      (phase-free ?p)
      (agent-available alice ?p)
      (not (task-completed prepare))
    )
    :effect (and
      (task-performed-in prepare ?p)
      (task-completed prepare)
      (not (phase-free ?p))
    )
  )

  ;; Action: Bob performs the "assemble" task in the phase that is the successor
  ;; of the phase where prepare was performed.
  ;; Preconditions:
  ;;   - there must exist a previous phase where prepare was performed,
  ;;   - the target phase must be the successor of that previous phase and free,
  ;;   - Bob must be available in the target phase,
  ;;   - the assemble task must exist and not already be completed.
  ;; Effects:
  ;;   - record that assemble was performed in that phase and mark it completed,
  ;;   - consume the phase.
  (:action bob-perform-assemble
    :parameters (?p-prev - phase ?p - phase)
    :precondition (and
      (agent bob)
      (task assemble)
      (phase ?p-prev)
      (phase ?p)
      (phase-next ?p-prev ?p)
      (task-performed-in prepare ?p-prev)
      (phase-free ?p)
      (agent-available bob ?p)
      (not (task-completed assemble))
    )
    :effect (and
      (task-performed-in assemble ?p)
      (task-completed assemble)
      (not (phase-free ?p))
    )
  )

  ;; Action: Alice performs the "test" task in the phase that is the successor
  ;; of the phase where assemble was performed.
  ;; Preconditions:
  ;;   - there must exist a previous phase where assemble was performed,
  ;;   - the target phase must be the successor of that previous phase and free,
  ;;   - Alice must be available in the target phase,
  ;;   - the test task must exist and not already be completed.
  ;; Effects:
  ;;   - record that test was performed in that phase and mark it completed,
  ;;   - consume the phase.
  (:action alice-perform-test
    :parameters (?p-prev - phase ?p - phase)
    :precondition (and
      (agent alice)
      (task test)
      (phase ?p-prev)
      (phase ?p)
      (phase-next ?p-prev ?p)
      (task-performed-in assemble ?p-prev)
      (phase-free ?p)
      (agent-available alice ?p)
      (not (task-completed test))
    )
    :effect (and
      (task-performed-in test ?p)
      (task-completed test)
      (not (phase-free ?p))
    )
  )
)