(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; disk placement predicates: immediate relations only (not transitive)
    (on-peg ?d - disk ?p - peg)        ;; ?d is directly on peg ?p (bottom disk of that peg when present)
    (on-disk ?d - disk ?under - disk) ;; ?d is directly on top of ?under
    (top ?p - peg ?d - disk)          ;; ?d is the top disk of peg ?p
    (peg-empty ?p - peg)              ;; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)   ;; d1 is smaller than d2
    ;; discrete stage progression to enforce single-disk contiguous steps
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk that is the only disk on the source peg to an empty destination peg
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (peg-empty ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; remove from source peg
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (peg-empty ?from)

      ;; place on destination peg (now top and directly on peg)
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move a top disk that is directly on another disk to an empty destination peg
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?under)
      (peg-empty ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; detach from its under-disk and update source peg top
      (not (on-disk ?d ?under))
      (not (top ?from ?d))
      (top ?from ?under)

      ;; place on destination peg
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move a top disk that is the only disk on the source peg to a non-empty destination peg (stack onto top)
  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; remove from source peg (it was sole disk)
      (not (on-peg ?d ?from))
      (not (top ?from ?d))
      (peg-empty ?from)

      ;; stack on destination top
      (not (top ?to ?t))
      (top ?to ?d)
      (on-disk ?d ?t)
    )
  )

  ;; Move a top disk that is directly on another disk to a non-empty destination peg (stack onto top)
  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?under)
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      ;; detach from under-disk and update source peg top
      (not (on-disk ?d ?under))
      (not (top ?from ?d))
      (top ?from ?under)

      ;; stack on destination top
      (not (top ?to ?t))
      (top ?to ?d)
      (on-disk ?d ?t)
    )
  )
)