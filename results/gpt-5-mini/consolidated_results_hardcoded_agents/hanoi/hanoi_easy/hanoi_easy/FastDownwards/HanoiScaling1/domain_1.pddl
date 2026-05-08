(define (domain hanoi3_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; placement predicates
    (on-peg ?d - disk ?p - peg)       ; disk directly on a peg (bottom disk of a stack)
    (on-disk ?d - disk ?under - disk) ; disk directly on another disk (immediately above)
    (top ?d - disk ?p - peg)          ; disk is the top disk on peg
    (empty ?p - peg)                  ; peg has no disks

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; staging / sequencing (explicit discrete stages)
    (current ?s - stage)              ; which stage is active
    (next ?s - stage ?s2 - stage)     ; successor relation between stages (static)
  )

  ;; Move a disk that is directly on a peg onto an empty peg
  (:action move-peg-to-empty
    :parameters (?x - disk ?p - peg ?q - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?x ?p)
      (top ?x ?p)
      (empty ?q)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?x ?p))
      (on-peg ?x ?q)

      ;; top/empty bookkeeping on source peg and target peg
      (not (top ?x ?p))
      (top ?x ?q)
      (not (empty ?q))
      (empty ?p)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (top of target peg)
  (:action move-peg-to-disk
    :parameters (?x - disk ?p - peg ?q - peg ?y - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?x ?p)
      (top ?x ?p)
      (top ?y ?q)
      (smaller ?x ?y)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update placement
      (not (on-peg ?x ?p))
      (on-disk ?x ?y)

      ;; top/empty bookkeeping
      (not (top ?x ?p))
      (top ?x ?q)
      (not (top ?y ?q))
      (not (empty ?q))
      (empty ?p)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk onto an empty peg
  (:action move-disk-to-empty
    :parameters (?x - disk ?under - disk ?p - peg ?q - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?x ?under)
      (top ?x ?p)
      (empty ?q)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update placement
      (not (on-disk ?x ?under))
      (on-peg ?x ?q)

      ;; top bookkeeping: x moves from peg ?p to ?q, under becomes new top on ?p
      (not (top ?x ?p))
      (top ?x ?q)
      (top ?under ?p)

      ;; target peg now non-empty
      (not (empty ?q))

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk onto another disk (top of target peg)
  (:action move-disk-to-disk
    :parameters (?x - disk ?under - disk ?p - peg ?q - peg ?y - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?x ?under)
      (top ?x ?p)
      (top ?y ?q)
      (smaller ?x ?y)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; update placement
      (not (on-disk ?x ?under))
      (on-disk ?x ?y)

      ;; top bookkeeping: x becomes top on target, y ceases to be top, under becomes top on source
      (not (top ?x ?p))
      (top ?x ?q)
      (not (top ?y ?q))
      (top ?under ?p)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)