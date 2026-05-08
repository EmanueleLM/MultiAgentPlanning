(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk is directly on a place (peg or another disk)
    (clear ?d - disk)                ; nothing on top of this disk
    (empty ?p - peg)                 ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is smaller than d2
  )

  ;; move top disk that is directly on a peg to an empty peg
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (empty ?dst)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?dst)
      (not (empty ?dst))
      (empty ?src)
    )
  )

  ;; move top disk that is directly on a peg onto another top disk
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?src - peg ?td - disk)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?td)
      (not (clear ?td))
      (empty ?src)
    )
  )

  ;; move top disk that sits on another disk to an empty peg
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?below - disk ?dst - peg)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (empty ?dst)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?dst)
      (clear ?below)
      (not (empty ?dst))
    )
  )

  ;; move top disk that sits on another disk onto another top disk
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?td - disk)
    :precondition (and
      (on ?d ?below)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?td)
      (clear ?below)
      (not (clear ?td))
    )
  )
)