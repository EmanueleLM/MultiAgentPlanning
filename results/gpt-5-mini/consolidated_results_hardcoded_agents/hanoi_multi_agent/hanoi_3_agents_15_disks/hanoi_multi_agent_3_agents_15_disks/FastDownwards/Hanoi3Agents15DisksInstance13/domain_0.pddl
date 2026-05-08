(define (domain hanoi-multiagent)
  (:requirements :typing :negative-preconditions :strips)
  (:types agent disk peg)

  (:predicates
    (on-disk ?d - disk ?below - disk)    ; d is directly on top of below
    (on-peg  ?d - disk ?p - peg)         ; d is directly on peg p
    (top     ?p - peg ?d - disk)         ; top disk on peg p is d
    (empty   ?p - peg)                   ; peg p is empty (no disks)
    (clear   ?d - disk)                  ; no disk on top of d
    (smaller ?d1 - disk ?d2 - disk)      ; d1 is smaller than d2
    (can-move ?a - agent ?d - disk)      ; agent a is permitted to move disk d
  )

  ;; Actions for Agent 1
  (:action move-a1-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a1 ?d)
      (on-disk ?d ?below)
      (top ?p ?d)
      (empty ?q)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?q)
      (not (empty ?q))
      (top ?q ?d)
      (not (top ?p ?d))
      (top ?p ?below)
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move-a1-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?tgt - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a1 ?d)
      (on-disk ?d ?below)
      (top ?p ?d)
      (top ?q ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)
      (not (top ?p ?d))
      (top ?p ?below)
      (not (top ?q ?tgt))
      (top ?q ?d)
      (clear ?below)
      (not (clear ?tgt))
      (clear ?d)
    )
  )

  (:action move-a1-from-peg-to-empty
    :parameters (?d - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a1 ?d)
      (on-peg ?d ?p)
      (top ?p ?d)
      (empty ?q)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on-peg ?d ?q)
      (not (empty ?q))
      (top ?q ?d)
      (not (top ?p ?d))
      (empty ?p)
      (clear ?d)
    )
  )

  (:action move-a1-from-peg-to-disk
    :parameters (?d - disk ?p - peg ?tgt - disk ?q - peg)
    :precondition (and
      (can-move a1 ?d)
      (on-peg ?d ?p)
      (top ?p ?d)
      (top ?q ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on-disk ?d ?tgt)
      (not (top ?p ?d))
      (empty ?p)
      (not (top ?q ?tgt))
      (top ?q ?d)
      (not (clear ?tgt))
      (clear ?d)
    )
  )

  ;; Actions for Agent 2 (distinct names; will be unusable unless can-move facts are given)
  (:action move-a2-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a2 ?d)
      (on-disk ?d ?below)
      (top ?p ?d)
      (empty ?q)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?q)
      (not (empty ?q))
      (top ?q ?d)
      (not (top ?p ?d))
      (top ?p ?below)
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move-a2-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?tgt - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a2 ?d)
      (on-disk ?d ?below)
      (top ?p ?d)
      (top ?q ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)
      (not (top ?p ?d))
      (top ?p ?below)
      (not (top ?q ?tgt))
      (top ?q ?d)
      (clear ?below)
      (not (clear ?tgt))
      (clear ?d)
    )
  )

  (:action move-a2-from-peg-to-empty
    :parameters (?d - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a2 ?d)
      (on-peg ?d ?p)
      (top ?p ?d)
      (empty ?q)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on-peg ?d ?q)
      (not (empty ?q))
      (top ?q ?d)
      (not (top ?p ?d))
      (empty ?p)
      (clear ?d)
    )
  )

  (:action move-a2-from-peg-to-disk
    :parameters (?d - disk ?p - peg ?tgt - disk ?q - peg)
    :precondition (and
      (can-move a2 ?d)
      (on-peg ?d ?p)
      (top ?p ?d)
      (top ?q ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on-disk ?d ?tgt)
      (not (top ?p ?d))
      (empty ?p)
      (not (top ?q ?tgt))
      (top ?q ?d)
      (not (clear ?tgt))
      (clear ?d)
    )
  )

  ;; Actions for Agent 3 (distinct names; will be unusable unless can-move facts are given)
  (:action move-a3-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a3 ?d)
      (on-disk ?d ?below)
      (top ?p ?d)
      (empty ?q)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?q)
      (not (empty ?q))
      (top ?q ?d)
      (not (top ?p ?d))
      (top ?p ?below)
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move-a3-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?tgt - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a3 ?d)
      (on-disk ?d ?below)
      (top ?p ?d)
      (top ?q ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)
      (not (top ?p ?d))
      (top ?p ?below)
      (not (top ?q ?tgt))
      (top ?q ?d)
      (clear ?below)
      (not (clear ?tgt))
      (clear ?d)
    )
  )

  (:action move-a3-from-peg-to-empty
    :parameters (?d - disk ?p - peg ?q - peg)
    :precondition (and
      (can-move a3 ?d)
      (on-peg ?d ?p)
      (top ?p ?d)
      (empty ?q)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on-peg ?d ?q)
      (not (empty ?q))
      (top ?q ?d)
      (not (top ?p ?d))
      (empty ?p)
      (clear ?d)
    )
  )

  (:action move-a3-from-peg-to-disk
    :parameters (?d - disk ?p - peg ?tgt - disk ?q - peg)
    :precondition (and
      (can-move a3 ?d)
      (on-peg ?d ?p)
      (top ?p ?d)
      (top ?q ?tgt)
      (smaller ?d ?tgt)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on-disk ?d ?tgt)
      (not (top ?p ?d))
      (empty ?p)
      (not (top ?q ?tgt))
      (top ?q ?d)
      (not (clear ?tgt))
      (clear ?d)
    )
  )

)