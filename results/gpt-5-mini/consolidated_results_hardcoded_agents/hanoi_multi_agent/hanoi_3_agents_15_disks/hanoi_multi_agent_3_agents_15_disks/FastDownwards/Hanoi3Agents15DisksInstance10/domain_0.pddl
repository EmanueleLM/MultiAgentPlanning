(define (domain multiagent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj disk peg agent)

  (:predicates
    (onpeg ?d - disk ?p - peg)            ; disk ?d belongs to peg ?p (which peg the disk is currently stacked on)
    (below ?d - disk ?s - obj)            ; immediate support of disk ?d is object ?s (either a disk or a peg)
    (topdisk ?d - disk)                   ; disk ?d has no disk above it (is the top of its stack)
    (empty ?p - peg)                      ; peg ?p has no disks
    (canmove ?a - agent ?d - disk)        ; agent ?a is allowed to move disk ?d
    (smaller ?d1 - disk ?d2 - disk)       ; disk ?d1 is smaller than disk ?d2
  )

  ;-------------------------
  ; Agent 1 actions (may move A-E)
  ; Four variants to avoid disjunctions: from-disk->onto-disk, from-disk->onto-empty, from-peg->onto-disk, from-peg->onto-empty
  ; from-disk: the disk's immediate support is another disk
  ; from-peg: the disk's immediate support is a peg
  ;-------------------------

  (:action agent1-move-from-disk-to-disk
    :parameters (?d - disk ?b - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove agent_1 ?d)
      (topdisk ?d)
      (below ?d ?b)                    ; ?b is the disk immediately below ?d
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
    :parameters (?d - disk ?b - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove agent_1 ?d)
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
    :parameters (?d - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove agent_1 ?d)
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
      (empty ?frompeg)                 ; since disk was directly on peg and moved, peg becomes empty
    )
  )

  (:action agent1-move-from-peg-to-empty
    :parameters (?d - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove agent_1 ?d)
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
  ;-------------------------
  (:action agent2-move-from-disk-to-disk
    :parameters (?d - disk ?b - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove agent_2 ?d)
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
    :parameters (?d - disk ?b - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove agent_2 ?d)
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
    :parameters (?d - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove agent_2 ?d)
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
    :parameters (?d - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove agent_2 ?d)
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
    :parameters (?d - disk ?b - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove agent_3 ?d)
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
    :parameters (?d - disk ?b - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove agent_3 ?d)
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
    :parameters (?d - disk ?frompeg - peg ?t - disk ?topeg - peg)
    :precondition (and
      (canmove agent_3 ?d)
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
    :parameters (?d - disk ?frompeg - peg ?topeg - peg)
    :precondition (and
      (canmove agent_3 ?d)
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