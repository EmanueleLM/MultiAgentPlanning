(define (domain hanoi-2agent-20-scheduled)
  (:requirements :strips :typing)
  (:types
    support
    peg disk - support
    agent step
  )
  (:predicates
    (on ?x - disk ?y - disk)
    (on-peg ?x - disk ?p - peg)
    (clear ?s - support)
    (smaller-than ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (at-step ?s - step)
    (next ?s1 - step ?s2 - step)
    (scheduled-agent ?s - step ?a - agent)
    (scheduled-disk ?s - step ?d - disk)
  )

  (:action move_scheduled_from_disk_to_disk
    :parameters (?ag - agent ?d - disk ?below - disk ?target - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-agent ?s ?ag)
      (scheduled-disk ?s ?d)
      (can-move ?ag ?d)
      (clear ?d)
      (on ?d ?below)
      (clear ?target)
      (smaller-than ?d ?target)
    )
    :effect (and
      (not (on ?d ?below))
      (clear ?below)
      (not (clear ?target))
      (on ?d ?target)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move_scheduled_from_disk_to_peg
    :parameters (?ag - agent ?d - disk ?below - disk ?p - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-agent ?s ?ag)
      (scheduled-disk ?s ?d)
      (can-move ?ag ?d)
      (clear ?d)
      (on ?d ?below)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?below))
      (clear ?below)
      (not (clear ?p))
      (on-peg ?d ?p)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move_scheduled_from_peg_to_disk
    :parameters (?ag - agent ?d - disk ?p - peg ?target - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-agent ?s ?ag)
      (scheduled-disk ?s ?d)
      (can-move ?ag ?d)
      (clear ?d)
      (on-peg ?d ?p)
      (clear ?target)
      (smaller-than ?d ?target)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (clear ?p)
      (not (clear ?target))
      (on ?d ?target)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move_scheduled_from_peg_to_peg
    :parameters (?ag - agent ?d - disk ?pfrom - peg ?pto - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-agent ?s ?ag)
      (scheduled-disk ?s ?d)
      (can-move ?ag ?d)
      (clear ?d)
      (on-peg ?d ?pfrom)
      (clear ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (clear ?pfrom)
      (not (clear ?pto))
      (on-peg ?d ?pto)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)