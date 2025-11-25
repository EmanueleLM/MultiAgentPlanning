(define (domain tower-of-hanoi)
  :requirements :strips :typing
  :types
    disk peg - place
    place
  :predicates
    ;; on ?d ?p means disk ?d is directly on place ?p (a peg or another disk)
    (on ?d - disk ?p - place)
    ;; clear ?p means there is no disk directly on place ?p
    (clear ?p - place)
    ;; smaller ?d1 ?d2 means disk ?d1 is strictly smaller than disk ?d2
    (smaller ?d1 - disk ?d2 - disk)
  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      ;; remove old support
      (not (on ?d ?from))
      ;; place on destination peg
      (on ?d ?to)
      ;; destination is no longer clear
      (not (clear ?to))
      ;; the supporting place from which the disk was removed becomes clear
      (clear ?from)
    )
  )
  ;; Move a top disk onto another disk (allowed only if moving disk is smaller)
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)