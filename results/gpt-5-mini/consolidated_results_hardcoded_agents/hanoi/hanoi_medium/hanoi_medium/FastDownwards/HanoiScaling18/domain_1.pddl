(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ; a disk is directly on another disk
    (on ?d - disk ?under - disk)
    ; a disk is directly on a peg
    (on-peg ?d - disk ?p - peg)

    ; nothing directly on this disk (it is the top of a stack)
    (clear-disk ?d - disk)
    ; nothing directly on this peg (peg empty)
    (clear-peg ?p - peg)

    ; static size ordering: true when first disk is strictly smaller than second disk
    (smaller ?smaller - disk ?larger - disk)

    ; staging predicates to force discrete, contiguous progression
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ; Move a top disk from a disk to another disk (both disks remain disks)
  (:action move_disk_disk_from_disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?to)
                    (smaller ?d ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ; the disk that was under ?d becomes clear now
              (clear-disk ?from)
              ; the disk that receives ?d is no longer clear
              (not (clear-disk ?to))
              ; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ; Move a top disk from a disk onto an empty peg
  (:action move_disk_peg_from_disk
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on-peg ?d ?to)
              ; disk under ?d becomes clear
              (clear-disk ?from)
              ; the peg that receives ?d is no longer clear
              (not (clear-peg ?to))
              ; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ; Move a top disk from a peg onto a disk
  (:action move_disk_disk_from_peg
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-disk ?to)
                    (smaller ?d ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on ?d ?to)
              ; the peg becomes clear when its top disk is removed
              (clear-peg ?from)
              ; the disk that receives ?d is no longer clear
              (not (clear-disk ?to))
              ; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )

  ; Move a top disk from a peg to an empty peg
  (:action move_disk_peg_from_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
                    (on-peg ?d ?from)
                    (clear-disk ?d)
                    (clear-peg ?to)
                    (current ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              ; from peg becomes clear
              (clear-peg ?from)
              ; to peg is no longer clear
              (not (clear-peg ?to))
              ; advance stage
              (not (current ?s))
              (current ?s2)
            )
  )
)