(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; disk-on-disk: disk A is directly on disk B
    (on ?d - disk ?under - disk)
    ; disk-on-peg: disk A is directly on peg P
    (on-peg ?d - disk ?p - peg)

    ; place clear predicates: true when there is no disk directly on the place
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)

    ; static size relation: true when first disk is strictly smaller than second disk
    (smaller ?smaller - disk ?larger - disk)
  )

  ; Move a top disk from a disk to another disk (target must be larger and target must be clear)
  (:action move_disk_disk_from_disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?to)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear-disk ?from)
              (not (clear-disk ?to))
            )
  )

  ; Move a top disk from a disk onto an empty peg
  (:action move_disk_peg_from_disk
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on-peg ?d ?to)
              (clear-disk ?from)
              (not (clear-peg ?to))
            )
  )

  ; Move a top disk from a peg onto a disk (target must be larger and clear)
  (:action move_disk_disk_from_peg
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?to)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on ?d ?to)
              (clear-peg ?from)
              (not (clear-disk ?to))
            )
  )

  ; Move a top disk from a peg to an empty peg
  (:action move_disk_peg_from_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (clear-peg ?from)
              (not (clear-peg ?to))
            )
  )
)