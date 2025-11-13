(define (domain hanoi2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    thing
    peg - thing
    disk - thing
    agent
    step
  )

  (:predicates
    (peg ?p - peg)
    (disk ?d - disk)
    (agent ?a - agent)

    ; Stacking and location
    (on ?d - disk ?x - thing)         ; disk on peg or on another disk
    (at-peg ?d - disk ?p - peg)       ; which peg the disk belongs to (transitively)

    ; Availability
    (clear ?x - thing)                ; no disk on thing (peg or disk)
    (top ?d - disk)                   ; disk has nothing above it (is movable)

    ; Size ordering: (larger X Y) => X strictly larger than Y
    (larger ?x - disk ?y - disk)

    ; Agent permissions
    (belongs ?d - disk ?a - agent)

    ; Step gating to enforce exact sequence
    (at-step ?s - step)
    (next ?s1 - step ?s2 - step)
    (allowed ?s - step ?d - disk ?from - peg ?to - peg)
  )

  ; Agent 1 actions (may move only disks that belong to agent_1)

  (:action move-a1-from-peg-to-emptypeg
    :parameters (?d - disk ?pf - peg ?pt - peg ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_1)
      (top ?d) (clear ?d)
      (on ?d ?pf) (at-peg ?d ?pf)
      (clear ?pt)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?pf))
      (clear ?pf)
      (on ?d ?pt)
      (not (clear ?pt))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )

  (:action move-a1-from-peg-to-disk
    :parameters (?d - disk ?pf - peg ?pt - peg ?x - disk ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_1)
      (top ?d) (clear ?d)
      (on ?d ?pf) (at-peg ?d ?pf)
      (at-peg ?x ?pt)
      (top ?x) (clear ?x)
      (larger ?x ?d)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?pf))
      (clear ?pf)
      (on ?d ?x)
      (not (clear ?x))
      (not (top ?x))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )

  (:action move-a1-from-disk-to-emptypeg
    :parameters (?d - disk ?u - disk ?pf - peg ?pt - peg ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_1)
      (top ?d) (clear ?d)
      (on ?d ?u)
      (at-peg ?d ?pf)
      (clear ?pt)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (top ?u)
      (on ?d ?pt)
      (not (clear ?pt))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )

  (:action move-a1-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?pf - peg ?pt - peg ?x - disk ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_1)
      (top ?d) (clear ?d)
      (on ?d ?u)
      (at-peg ?d ?pf)
      (at-peg ?x ?pt)
      (top ?x) (clear ?x)
      (larger ?x ?d)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (top ?u)
      (on ?d ?x)
      (not (clear ?x))
      (not (top ?x))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )

  ; Agent 2 actions (may move only disks that belong to agent_2)

  (:action move-a2-from-peg-to-emptypeg
    :parameters (?d - disk ?pf - peg ?pt - peg ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_2)
      (top ?d) (clear ?d)
      (on ?d ?pf) (at-peg ?d ?pf)
      (clear ?pt)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?pf))
      (clear ?pf)
      (on ?d ?pt)
      (not (clear ?pt))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )

  (:action move-a2-from-peg-to-disk
    :parameters (?d - disk ?pf - peg ?pt - peg ?x - disk ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_2)
      (top ?d) (clear ?d)
      (on ?d ?pf) (at-peg ?d ?pf)
      (at-peg ?x ?pt)
      (top ?x) (clear ?x)
      (larger ?x ?d)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?pf))
      (clear ?pf)
      (on ?d ?x)
      (not (clear ?x))
      (not (top ?x))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )

  (:action move-a2-from-disk-to-emptypeg
    :parameters (?d - disk ?u - disk ?pf - peg ?pt - peg ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_2)
      (top ?d) (clear ?d)
      (on ?d ?u)
      (at-peg ?d ?pf)
      (clear ?pt)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (top ?u)
      (on ?d ?pt)
      (not (clear ?pt))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )

  (:action move-a2-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?pf - peg ?pt - peg ?x - disk ?s - step ?s2 - step)
    :precondition (and
      (belongs ?d agent_2)
      (top ?d) (clear ?d)
      (on ?d ?u)
      (at-peg ?d ?pf)
      (at-peg ?x ?pt)
      (top ?x) (clear ?x)
      (larger ?x ?d)
      (at-step ?s) (next ?s ?s2)
      (allowed ?s ?d ?pf ?pt)
    )
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (top ?u)
      (on ?d ?x)
      (not (clear ?x))
      (not (top ?x))
      (not (at-peg ?d ?pf))
      (at-peg ?d ?pt)
      (top ?d) (clear ?d)
      (not (at-step ?s)) (at-step ?s2)
    )
  )
)