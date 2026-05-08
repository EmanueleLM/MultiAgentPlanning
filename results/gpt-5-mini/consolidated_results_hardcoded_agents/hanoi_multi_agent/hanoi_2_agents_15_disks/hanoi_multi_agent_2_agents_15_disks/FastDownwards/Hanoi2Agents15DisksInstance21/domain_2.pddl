(define (domain hanoi-multiagent-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?s - disk)       ; ?d is directly on top of disk ?s
    (on-peg ?d - disk ?p - peg)         ; ?d is directly on peg (bottommost disk if there are multiple)
    (clear ?d - disk)                   ; no disk on top of ?d
    (peg-empty ?p - peg)                ; peg has no disk directly on it
    (agent1-disk ?d - disk)             ; disk movable by agent_1
    (agent2-disk ?d - disk)             ; disk movable by agent_2
    (smaller ?d1 - disk ?d2 - disk)     ; ?d1 is smaller than ?d2
  )

  ;; Agent 1 actions: move when disk currently directly on another disk -> move onto another disk (destination disk can be anywhere, as long as it is clear)
  (:action move-agent_1-from-disk-to-disk
    :parameters (?d - disk ?s - disk ?y - disk)
    :precondition (and
      (agent1-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (clear ?y)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?y)
      (clear ?d)
      (clear ?s)
      (not (clear ?y))
    )
  )

  ;; Agent 1 actions: move when disk currently directly on another disk to an empty peg
  (:action move-agent_1-from-disk-to-empty
    :parameters (?d - disk ?s - disk ?dest - peg)
    :precondition (and
      (agent1-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?dest)
      (clear ?d)
      (clear ?s)
      (not (peg-empty ?dest))
    )
  )

  ;; Agent 1 actions: move when disk is directly on a peg onto another disk (destination disk can be anywhere, as long as it is clear)
  (:action move-agent_1-from-peg-to-disk
    :parameters (?d - disk ?srcpeg - peg ?y - disk)
    :precondition (and
      (agent1-disk ?d)
      (on-peg ?d ?srcpeg)
      (clear ?d)
      (clear ?y)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-peg ?d ?srcpeg))
      (on-disk ?d ?y)
      (clear ?d)
      (peg-empty ?srcpeg)
      (not (clear ?y))
    )
  )

  ;; Agent 1 actions: move when disk is directly on a peg to an empty peg
  (:action move-agent_1-from-peg-to-empty
    :parameters (?d - disk ?srcpeg - peg ?dest - peg)
    :precondition (and
      (agent1-disk ?d)
      (on-peg ?d ?srcpeg)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-peg ?d ?srcpeg))
      (on-peg ?d ?dest)
      (clear ?d)
      (peg-empty ?srcpeg)
      (not (peg-empty ?dest))
    )
  )

  ;; Agent 2 actions: same as agent 1 but limited to agent2-disk
  (:action move-agent_2-from-disk-to-disk
    :parameters (?d - disk ?s - disk ?y - disk)
    :precondition (and
      (agent2-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (clear ?y)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?y)
      (clear ?d)
      (clear ?s)
      (not (clear ?y))
    )
  )

  (:action move-agent_2-from-disk-to-empty
    :parameters (?d - disk ?s - disk ?dest - peg)
    :precondition (and
      (agent2-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?dest)
      (clear ?d)
      (clear ?s)
      (not (peg-empty ?dest))
    )
  )

  (:action move-agent_2-from-peg-to-disk
    :parameters (?d - disk ?srcpeg - peg ?y - disk)
    :precondition (and
      (agent2-disk ?d)
      (on-peg ?d ?srcpeg)
      (clear ?d)
      (clear ?y)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-peg ?d ?srcpeg))
      (on-disk ?d ?y)
      (clear ?d)
      (peg-empty ?srcpeg)
      (not (clear ?y))
    )
  )

  (:action move-agent_2-from-peg-to-empty
    :parameters (?d - disk ?srcpeg - peg ?dest - peg)
    :precondition (and
      (agent2-disk ?d)
      (on-peg ?d ?srcpeg)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-peg ?d ?srcpeg))
      (on-peg ?d ?dest)
      (clear ?d)
      (peg-empty ?srcpeg)
      (not (peg-empty ?dest))
    )
  )
)