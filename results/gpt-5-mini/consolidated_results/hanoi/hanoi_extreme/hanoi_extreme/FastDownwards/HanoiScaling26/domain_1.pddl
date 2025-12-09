(define (domain hanoi-7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage - object)

  (:predicates
    ;; disk is directly on a place (a disk or a peg)
    (on ?d - disk ?p - place)
    ;; disk has no disk on top of it (is the top of its local stack)
    (clear ?d - disk)
    ;; peg has no disk directly on it (is empty)
    (empty ?p - peg)
    ;; static size ordering: first disk is smaller than second
    (smaller ?d1 - disk ?d2 - disk)
    ;; current stage token (exactly one true at any time)
    (current ?s - stage)
    ;; successor relation between stages
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a clear disk that is directly on a disk, onto another clear disk.
  ;; Advances the global stage from a successor to the next.
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
              ;; the disk we removed from becomes clear
              (clear ?from)
              ;; the disk we placed onto is no longer clear
              (not (clear ?to))
              ;; advance the stage token
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
              ;; the disk we removed from becomes clear
              (clear ?from)
              ;; the peg we placed onto is no longer empty
              (not (empty ?to))
              ;; advance the stage token
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
              ;; the peg we removed from becomes empty
              (empty ?from)
              ;; the disk we placed onto is no longer clear
              (not (clear ?to))
              ;; advance the stage token
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
              ;; source peg becomes empty, destination peg no longer empty
              (empty ?from)
              (not (empty ?to))
              ;; advance the stage token
              (not (current ?s1))
              (current ?s2)
            )
  )
)