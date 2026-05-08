(define (domain hanoi3)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; structural predicates
    (on-peg ?d - disk ?p - peg)     ; disk directly on peg
    (on-disk ?d - disk ?under - disk) ; disk directly on another disk
    (top ?d - disk ?p - peg)        ; disk is top on peg
    (empty ?p - peg)                ; peg has no disks
    ;; static size ordering (must be provided in the problem as static facts)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk that is directly on a peg onto an empty peg
  (:action move-peg-to-empty
    :parameters (?x - disk ?p - peg ?q - peg)
    :precondition (and
      (on-peg ?x ?p)
      (top ?x ?p)
      (empty ?q)
    )
    :effect (and
      (not (on-peg ?x ?p))
      (on-peg ?x ?q)
      (not (top ?x ?p))
      (top ?x ?q)
      (not (empty ?q))
      (empty ?p)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (top of target peg)
  (:action move-peg-to-disk
    :parameters (?x - disk ?p - peg ?q - peg ?y - disk)
    :precondition (and
      (on-peg ?x ?p)
      (top ?x ?p)
      (top ?y ?q)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on-peg ?x ?p))
      (on-disk ?x ?y)
      (not (top ?x ?p))
      (top ?x ?q)
      (not (top ?y ?q))
      (empty ?p)
    )
  )

  ;; Move a disk that is directly on another disk onto an empty peg
  (:action move-disk-to-empty
    :parameters (?x - disk ?under - disk ?p - peg ?q - peg)
    :precondition (and
      (on-disk ?x ?under)
      (top ?x ?p)
      (empty ?q)
    )
    :effect (and
      (not (on-disk ?x ?under))
      (on-peg ?x ?q)
      (not (top ?x ?p))
      (top ?x ?q)
      (not (empty ?q))
      ;; the disk that was beneath becomes the new top on the same peg
      (top ?under ?p)
    )
  )

  ;; Move a disk that is directly on another disk onto another disk (top of target peg)
  (:action move-disk-to-disk
    :parameters (?x - disk ?under - disk ?p - peg ?q - peg ?y - disk)
    :precondition (and
      (on-disk ?x ?under)
      (top ?x ?p)
      (top ?y ?q)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on-disk ?x ?under))
      (on-disk ?x ?y)
      (not (top ?x ?p))
      (top ?x ?q)
      (not (top ?y ?q))
      ;; the disk that was beneath becomes the new top on the same peg
      (top ?under ?p)
    )
  )
)