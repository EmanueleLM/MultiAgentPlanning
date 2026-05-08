(define (domain hanoi4_serial)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-disk ?d - disk ?below - disk)     ; d is immediately on top of below (both same peg)
    (on-peg  ?d - disk ?p - peg)          ; d is directly on an empty peg (no disk below)
    (at      ?d - disk ?p - peg)          ; d is located on peg p (either on-peg or via on-disk chain)
    (clear-disk ?d - disk)                ; d has no disk on top (is top disk of its peg)
    (clear-peg  ?p - peg)                 ; peg p has no disks
    (smaller ?s - disk ?l - disk)         ; s is smaller than l
    (current-step ?st - step)             ; enforces ordered stage progression
    (next ?st1 - step ?st2 - step)        ; successor relation over steps
    (different ?p1 - peg ?p2 - peg)       ; explicit inequality among pegs
  )

  (:action move_from_peg_to_empty
    :parameters (?d - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-peg ?d ?p_src)
      (at ?d ?p_src)
      (clear-disk ?d)
      (clear-peg ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?p_src))
      (not (at ?d ?p_src))
      (clear-peg ?p_src)
      (on-peg ?d ?p_dest)
      (at ?d ?p_dest)
      (not (clear-peg ?p_dest))
      (clear-disk ?d)
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  (:action move_from_disk_to_empty
    :parameters (?d - disk ?b - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-disk ?d ?b)
      (at ?d ?p_src)
      (at ?b ?p_src)
      (clear-disk ?d)
      (clear-peg ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?b))
      (not (at ?d ?p_src))
      (clear-disk ?b)
      (on-peg ?d ?p_dest)
      (at ?d ?p_dest)
      (not (clear-peg ?p_dest))
      (clear-disk ?d)
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  (:action move_from_peg_to_disk
    :parameters (?d - disk ?p_src - peg ?p_dest - peg ?t - disk ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-peg ?d ?p_src)
      (at ?d ?p_src)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (at ?t ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?p_src))
      (not (at ?d ?p_src))
      (clear-peg ?p_src)
      (on-disk ?d ?t)
      (at ?d ?p_dest)
      (not (clear-disk ?t))
      (clear-disk ?d)
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  (:action move_from_disk_to_disk
    :parameters (?d - disk ?b - disk ?t - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-disk ?d ?b)
      (at ?d ?p_src)
      (at ?b ?p_src)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (at ?t ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?b))
      (not (at ?d ?p_src))
      (clear-disk ?b)
      (on-disk ?d ?t)
      (at ?d ?p_dest)
      (not (clear-disk ?t))
      (clear-disk ?d)
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)