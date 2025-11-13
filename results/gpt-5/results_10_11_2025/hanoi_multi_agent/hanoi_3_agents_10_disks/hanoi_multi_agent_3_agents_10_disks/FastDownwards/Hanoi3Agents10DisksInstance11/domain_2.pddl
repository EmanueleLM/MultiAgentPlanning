(define (domain hanoi3agents_staged)
  (:requirements :strips :typing)
  (:types disk peg agent stage)
  (:predicates
    (on ?d - disk ?x - disk)          ; disk d is on disk x
    (on-peg ?d - disk ?p - peg)       ; disk d is directly on peg p
    (clear ?d - disk)                 ; nothing on top of disk d
    (clear-peg ?p - peg)              ; peg p has no disk on it
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2 (static)
    (can-move ?a - agent ?d - disk)   ; agent a is allowed to move disk d (static)
    (cur ?s - stage)                  ; current stage
    (next ?s1 - stage ?s2 - stage)    ; stage successor relation
  )

  ; move a top disk from a peg to an empty peg (consumes a stage)
  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg ?s - stage ?s2 - stage)
    :precondition (and
      (cur ?s)
      (next ?s ?s2)
      (can-move ?a ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (clear-peg ?p2))
    :effect (and
      (not (cur ?s))
      (cur ?s2)
      (not (on-peg ?d ?p1))
      (on-peg ?d ?p2)
      (clear-peg ?p1)
      (not (clear-peg ?p2))
    )
  )

  ; move a top disk from a peg onto a larger clear disk (consumes a stage)
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (cur ?s)
      (next ?s ?s2)
      (can-move ?a ?d)
      (on-peg ?d ?p)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t))
    :effect (and
      (not (cur ?s))
      (cur ?s2)
      (not (on-peg ?d ?p))
      (on ?d ?t)
      (clear-peg ?p)
      (not (clear ?t))
    )
  )

  ; move a top disk from a disk to an empty peg (consumes a stage)
  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?b - disk ?p - peg ?s - stage ?s2 - stage)
    :precondition (and
      (cur ?s)
      (next ?s ?s2)
      (can-move ?a ?d)
      (on ?d ?b)
      (clear ?d)
      (clear-peg ?p))
    :effect (and
      (not (cur ?s))
      (cur ?s2)
      (not (on ?d ?b))
      (clear ?b)
      (on-peg ?d ?p)
      (not (clear-peg ?p))
    )
  )

  ; move a top disk from a disk onto a larger clear disk (consumes a stage)
  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?b - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (cur ?s)
      (next ?s ?s2)
      (can-move ?a ?d)
      (on ?d ?b)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t))
    :effect (and
      (not (cur ?s))
      (cur ?s2)
      (not (on ?d ?b))
      (clear ?b)
      (on ?d ?t)
      (not (clear ?t))
    )
  )
)