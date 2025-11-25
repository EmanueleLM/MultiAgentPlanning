(define (domain hanoi-5-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place agent)

  (:predicates
    ;; unary type markers (places include pegs and disks)
    (disk ?x - place)
    (peg ?x - place)

    ;; structural relations
    (on ?d - place ?p - place)   ;; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)           ;; nothing is directly on place ?p (place can be peg or disk)

    ;; ordering relation among disks (static)
    (smaller ?d1 - place ?d2 - place)
  )

  ;; Move a (top) disk onto an empty peg
  (:action move-to-peg
    :parameters (?a - agent ?d - place ?from - place ?to - place)
    :precondition (and
      (disk ?d)
      (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?d ?to))
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; the destination is no longer clear (it has ?d on it)
      (not (clear ?to))

      ;; the source becomes clear (we removed its top disk)
      (clear ?from)
    )
  )

  ;; Move a (top) disk onto another disk (only if smaller)
  (:action move-to-disk
    :parameters (?a - agent ?d - place ?from - place ?to - place)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?d ?to))
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk is no longer clear
      (not (clear ?to))

      ;; source becomes clear
      (clear ?from)
    )
  )
)