(define (domain multiagent-hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  ;; Types: make disk and peg subtypes of object so "below" can refer to either
  (:types disk peg agent - object)

  (:predicates
    (onpeg ?d - disk ?p - peg)            ; disk ?d is on peg ?p (belongs to that peg)
    (below ?d - disk ?s - object)         ; immediate support of ?d is ?s (either a disk or a peg)
    (topdisk ?d - disk)                   ; disk ?d has no disk above it (is top of its stack)
    (empty ?p - peg)                      ; peg ?p currently has no disks
    (canmove ?a - agent ?d - disk)        ; agent ?a is allowed to move disk ?d
    (smaller ?d1 - disk ?d2 - disk)       ; disk ?d1 is smaller than disk ?d2
  )

  ;-------------------------
  ; Agent 1 actions (may move A-E)
  ; Four variants to cover whether disk's immediate support is a disk or a peg,
  ; and whether destination is a disk or an empty peg.
  ;-------------------------
  (:action agent1-move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?b - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?b)                    ; ?d is immediately on disk ?b
      (onpeg ?d ?frompeg)
      (topdisk ?t)
      (onpeg ?t ?topeg)
      (smaller ?d ?t)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?b))
      (below ?d ?t)
      (not (topdisk ?t))
      (topdisk ?b)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
    )
  )

  (:action agent1-move-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?b - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?b)
      (onpeg ?d ?frompeg)
      (empty ?topeg)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?b))
      (below ?d ?topeg)
      (topdisk ?b)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (not (empty ?topeg))
    )
  )

  (:action agent1-move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?frompeg)              ; immediate support is a peg
      (onpeg ?d ?frompeg)
      (topdisk ?t)
      (onpeg ?t ?topeg)
      (smaller ?d ?t)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?frompeg))
      (below ?d ?t)
      (not (topdisk ?t))
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (empty ?frompeg)
    )
  )

  (:action agent1-move-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?frompeg)
      (onpeg ?d ?frompeg)
      (empty ?topeg)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?frompeg))
      (below ?d ?topeg)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (not (empty ?topeg))
      (empty ?frompeg)
    )
  )

  ;-------------------------
  ; Agent 2 actions (may move F-J)
  ; Mirror agent1 actions but allowed only for agent_2 via canmove facts
  ;-------------------------
  (:action agent2-move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?b - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?b)
      (onpeg ?d ?frompeg)
      (topdisk ?t)
      (onpeg ?t ?topeg)
      (smaller ?d ?t)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?b))
      (below ?d ?t)
      (not (topdisk ?t))
      (topdisk ?b)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
    )
  )

  (:action agent2-move-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?b - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?b)
      (onpeg ?d ?frompeg)
      (empty ?topeg)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?b))
      (below ?d ?topeg)
      (topdisk ?b)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (not (empty ?topeg))
    )
  )

  (:action agent2-move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?frompeg)
      (onpeg ?d ?frompeg)
      (topdisk ?t)
      (onpeg ?t ?topeg)
      (smaller ?d ?t)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?frompeg))
      (below ?d ?t)
      (not (topdisk ?t))
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (empty ?frompeg)
    )
  )

  (:action agent2-move-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?frompeg)
      (onpeg ?d ?frompeg)
      (empty ?topeg)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?frompeg))
      (below ?d ?topeg)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (not (empty ?topeg))
      (empty ?frompeg)
    )
  )

  ;-------------------------
  ; Agent 3 actions (may move K-O)
  ;-------------------------
  (:action agent3-move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?b - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?b)
      (onpeg ?d ?frompeg)
      (topdisk ?t)
      (onpeg ?t ?topeg)
      (smaller ?d ?t)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?b))
      (below ?d ?t)
      (not (topdisk ?t))
      (topdisk ?b)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
    )
  )

  (:action agent3-move-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?b - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?b)
      (onpeg ?d ?frompeg)
      (empty ?topeg)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?b))
      (below ?d ?topeg)
      (topdisk ?b)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (not (empty ?topeg))
    )
  )

  (:action agent3-move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?frompeg)
      (onpeg ?d ?frompeg)
      (topdisk ?t)
      (onpeg ?t ?topeg)
      (smaller ?d ?t)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?frompeg))
      (below ?d ?t)
      (not (topdisk ?t))
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (empty ?frompeg)
    )
  )

  (:action agent3-move-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove ?a ?d)
      (topdisk ?d)
      (below ?d ?frompeg)
      (onpeg ?d ?frompeg)
      (empty ?topeg)
    )
    :effect (and
      (not (topdisk ?d))
      (not (below ?d ?frompeg))
      (below ?d ?topeg)
      (not (onpeg ?d ?frompeg))
      (onpeg ?d ?topeg)
      (not (empty ?topeg))
      (empty ?frompeg)
    )
  )
)