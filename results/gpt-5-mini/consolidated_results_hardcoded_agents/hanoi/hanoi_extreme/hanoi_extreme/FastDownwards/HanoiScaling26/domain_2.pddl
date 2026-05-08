(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)       ; disk is directly on a place (disk or peg)
    (clear ?d - disk)              ; disk has no disk on top of it
    (empty ?p - peg)               ; peg has no disk directly on it
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: ?d1 is smaller than ?d2
    (current ?s - stage)           ; current global stage token
    (succ ?s1 - stage ?s2 - stage) ; successor relation between stages
  )

  ;; Move a clear disk that is directly on a disk, onto another clear disk.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s1 - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (current ?s1)
                    (succ ?s1 ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
              (not (current ?s1))
              (current ?s2)
            )
  )

  ;; Move a clear disk that is directly on a disk, onto an empty peg.
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s1 - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (empty ?to)
                    (current ?s1)
                    (succ ?s1 ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (empty ?to))
              (not (current ?s1))
              (current ?s2)
            )
  )

  ;; Move a clear disk that is directly on a peg, onto a clear disk.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s1 - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (current ?s1)
                    (succ ?s1 ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (empty ?from)
              (not (clear ?to))
              (not (current ?s1))
              (current ?s2)
            )
  )

  ;; Move a clear disk that is directly on a peg, onto an empty peg.
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s1 - stage ?s2 - stage)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (empty ?to)
                    (current ?s1)
                    (succ ?s1 ?s2)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (empty ?from)
              (not (empty ?to))
              (not (current ?s1))
              (current ?s2)
            )
  )
)