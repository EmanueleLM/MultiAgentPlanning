(define (domain hanoi-3peg-20disks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    peg disk agent
  )
  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg
    (on ?d - disk ?u - disk)           ; disk on another disk
    (clear ?d - disk)                  ; no disk on top of this disk
    (clear-peg ?p - peg)               ; peg has no disk
    (top ?d - disk ?p - peg)           ; d is the topmost disk of peg p
    (smaller ?x - disk ?y - disk)      ; x is smaller than y
    (permitted ?a - agent ?d - disk)   ; agent a may move disk d
  )

  ; move a clear disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?a - agent ?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on-peg ?d ?pfrom)
      (clear-peg ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on-peg ?d ?pto)
      (clear-peg ?pfrom)
      (not (clear-peg ?pto))
      (top ?d ?pto)
      (not (top ?d ?pfrom))
    )
  )

  ; move a clear disk that is directly on a peg onto the top disk of another peg
  (:action move-peg-to-disk
    :parameters (?a - agent ?d - disk ?pfrom - peg ?t - disk ?pto - peg)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on-peg ?d ?pfrom)
      (clear ?t)
      (smaller ?d ?t)
      (top ?t ?pto)
    )
    :effect (and
      (not (on-peg ?d ?pfrom))
      (on ?d ?t)
      (not (clear ?t))
      (clear-peg ?pfrom)
      (top ?d ?pto)
      (not (top ?t ?pto))
    )
  )

  ; move a clear disk that is on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?a - agent ?d - disk ?u - disk ?pto - peg)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on ?d ?u)
      (clear-peg ?pto)
    )
    :effect (and
      (not (on ?d ?u))
      (on-peg ?d ?pto)
      (clear ?u)
      (not (clear-peg ?pto))
      (top ?d ?pto)
    )
  )

  ; move a clear disk that is on another disk onto the top disk of a (possibly different) peg
  (:action move-disk-to-disk
    :parameters (?a - agent ?d - disk ?u - disk ?t - disk ?pto - peg)
    :precondition (and
      (permitted ?a ?d)
      (clear ?d)
      (on ?d ?u)
      (clear ?t)
      (smaller ?d ?t)
      (top ?t ?pto)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?t)
      (clear ?u)
      (not (clear ?t))
      (top ?d ?pto)
      (not (top ?t ?pto))
    )
  )
)