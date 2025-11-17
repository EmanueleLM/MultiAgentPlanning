(define (domain hanoi-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?b - disk)        ; disk ?d is directly on disk ?b
    (onpeg ?d - disk ?p - peg)     ; disk ?d is directly on peg ?p
    (clear ?d - disk)              ; disk ?d has nothing on top
    (peg-empty ?p - peg)           ; peg ?p currently has no disks
    (smaller ?d1 - disk ?d2 - disk) ; static size relation: ?d1 is smaller than ?d2
    (can-move ?a - agent ?d - disk) ; which agent may move which disk
  )

  ;; Move a disk that is directly on another disk onto another disk
  (:action move-disk-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
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

  ;; Move a disk that is directly on a peg onto a disk
  (:action move-disk-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?to - disk)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (onpeg ?d ?p)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (onpeg ?d ?p))
      (on ?d ?to)
      (not (clear ?to))
      (peg-empty ?p)
    )
  )

  ;; Move a disk that is directly on another disk onto an empty peg
  (:action move-disk-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (peg-empty ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (onpeg ?d ?p)
      (clear ?from)
      (not (peg-empty ?p))
    )
  )

  ;; Move a disk that is directly on a peg onto an empty peg
  (:action move-disk-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (onpeg ?d ?p1)
      (peg-empty ?p2)
    )
    :effect (and
      (not (onpeg ?d ?p1))
      (onpeg ?d ?p2)
      (peg-empty ?p1)
      (not (peg-empty ?p2))
    )
  )
)