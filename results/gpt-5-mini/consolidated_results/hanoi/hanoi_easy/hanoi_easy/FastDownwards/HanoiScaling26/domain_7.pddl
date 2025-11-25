(define (domain hanoi_orchestrated)
  (:requirements :typing :strips :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)

    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (on ?d - disk ?p - peg)
    (on-disk ?u - disk ?v - disk)
    (smaller ?u - disk ?v - disk)
  )

  (:action move_from_peg_to_empty
    :parameters (?d - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (empty ?dst)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (top ?src ?d))
      (not (on ?d ?src))

      (empty ?src)

      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)
    )
  )

  (:action move_from_peg_to_nonempty
    :parameters (?d - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on ?d ?src)
      (top ?dst ?z)
      (smaller ?d ?z)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (top ?src ?d))
      (not (on ?d ?src))

      (empty ?src)

      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)
      (not (empty ?dst))
    )
  )

  (:action move_from_disk_to_empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (empty ?dst)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (top ?src ?d))
      (not (on-disk ?d ?below))

      (top ?src ?below)

      (not (empty ?dst))
      (on ?d ?dst)
      (top ?dst ?d)
    )
  )

  (:action move_from_disk_to_nonempty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg ?z - disk ?s1 - stage ?s2 - stage)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top ?dst ?z)
      (smaller ?d ?z)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (top ?src ?d))
      (not (on-disk ?d ?below))

      (top ?src ?below)

      (not (top ?dst ?z))
      (on-disk ?d ?z)
      (top ?dst ?d)
      (not (empty ?dst))
    )
  )
)