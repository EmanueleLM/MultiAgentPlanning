(define (domain hanoi-2agents-10disks)
  (:requirements :strips :typing)
  (:types
    agent
    place
    peg disk - place
  )
  (:predicates
    ; location and availability
    (on ?d - disk ?p - place)
    (clear ?p - place)

    ; size ordering: smaller(d1,d2) means d1 strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)

    ; agent-specific permissions
    (may-move ?a - agent ?d - disk)
  )

  ; Move a disk onto an empty peg
  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (may-move ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a disk onto the top of another (larger) disk
  (:action move-to-disk
    :parameters (?ag - agent ?d1 - disk ?from - place ?d2 - disk)
    :precondition (and
      (may-move ?ag ?d1)
      (clear ?d1)
      (on ?d1 ?from)
      (clear ?d2)
      (smaller ?d1 ?d2)
    )
    :effect (and
      (not (on ?d1 ?from))
      (on ?d1 ?d2)
      (clear ?from)
      (not (clear ?d2))
    )
  )
)