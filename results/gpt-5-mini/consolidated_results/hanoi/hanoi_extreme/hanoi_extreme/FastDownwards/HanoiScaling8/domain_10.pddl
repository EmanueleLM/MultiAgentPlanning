(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; disk is directly on a place (a peg or another disk)
    (on ?d - disk ?p - place)

    ;; nothing on top of this disk
    (clear ?d - disk)

    ;; peg has no disk directly on it
    (empty ?p - peg)

    ;; disk size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage objects and progression
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (empty ?dst)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (empty ?dst))
      (empty ?src)
      ;; moved disk remains clear (top)
      (clear ?d)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?src - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?td)
      (not (clear ?td))
      (empty ?src)
      (clear ?d)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that sits on another disk to an empty peg.
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?below - disk ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (empty ?dst)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?dst)
      (clear ?below)
      (not (empty ?dst))
      (clear ?d)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a disk that sits on another disk onto another top disk.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?td)
      (clear ?below)
      (not (clear ?td))
      (clear ?d)
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)