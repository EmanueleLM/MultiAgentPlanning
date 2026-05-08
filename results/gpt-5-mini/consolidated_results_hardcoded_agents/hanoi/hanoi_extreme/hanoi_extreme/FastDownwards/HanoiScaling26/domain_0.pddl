(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk is directly on place (a disk or a peg)
    (on ?d - disk ?p - place)
    ;; disk has no disk on top of it (is top of its local stack)
    (clear ?d - disk)
    ;; peg has no disk directly on it (is empty)
    (empty ?p - peg)
    ;; static size ordering: first disk is smaller than second
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a clear disk that is directly on a disk, onto another clear disk.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ;; the disk we removed from becomes clear (no disk on it)
              (clear ?from)
              ;; the disk we placed onto is no longer clear
              (not (clear ?to))
            )
  )

  ;; Move a clear disk that is directly on a disk, onto an empty peg.
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (empty ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ;; the disk we removed from becomes clear
              (clear ?from)
              ;; the peg we placed onto is no longer empty
              (not (empty ?to))
            )
  )

  ;; Move a clear disk that is directly on a peg, onto a clear disk.
  ;; (A disk directly on a peg and clear implies it is the only disk directly on that peg;
  ;; after removal the peg becomes empty.)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ;; the peg we removed from becomes empty
              (empty ?from)
              ;; the disk we placed onto is no longer clear
              (not (clear ?to))
            )
  )

  ;; Move a clear disk that is directly on a peg, onto an empty peg.
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (empty ?to)
                    (not (on ?d ?to))
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ;; source peg becomes empty, destination peg no longer empty
              (empty ?from)
              (not (empty ?to))
            )
  )

)