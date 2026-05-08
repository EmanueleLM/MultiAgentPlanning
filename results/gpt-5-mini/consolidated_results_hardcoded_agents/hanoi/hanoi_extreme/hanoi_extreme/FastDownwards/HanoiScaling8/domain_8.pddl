(define (domain hanoi-mover)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk is the bottom-most disk on peg
    (on-disk ?d - disk ?below - disk)  ; disk is directly on top of another disk
    (clear ?d - disk)                  ; no disk on top of this disk (it is top)
    (empty ?p - peg)                   ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a top disk that is the only disk on its source peg to an empty destination peg.
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?src)
      (clear ?d)
      (empty ?dst)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?src))
      (on-peg ?d ?dst)

      (empty ?src)
      (not (empty ?dst))
    )
  )

  ;; Move a top disk that is the only disk on its source peg onto another top disk.
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?src - peg ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?src)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?src))
      (on-disk ?d ?td)

      (empty ?src)
      (not (clear ?td))
    )
  )

  ;; Move a top disk that sits on another disk to an empty destination peg.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?dst - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?dst)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-peg ?d ?dst)

      (clear ?below)
      (not (empty ?dst))
    )
  )

  ;; Move a top disk that sits on another disk onto another top disk.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?td - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-disk ?d ?td)

      (clear ?below)
      (not (clear ?td))
    )
  )
)