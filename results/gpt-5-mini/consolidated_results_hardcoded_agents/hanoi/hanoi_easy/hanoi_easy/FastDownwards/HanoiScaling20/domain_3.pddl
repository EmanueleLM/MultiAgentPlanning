(define (domain hanoi4_serial)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-disk ?d - disk ?below - disk)   ; ?d directly on top of disk ?below
    (on-peg  ?d - disk ?p - peg)        ; ?d directly on peg ?p (i.e., bottom disk of that peg)
    (loc     ?d - disk ?p - peg)        ; disk ?d is located on peg ?p (somewhere in the stack)
    (clear-disk ?d - disk)              ; no disk directly on ?d (i.e., ?d is top of its peg)
    (clear-peg  ?p - peg)               ; peg ?p has no disks directly on it (empty peg)
    (smaller ?s - disk ?l - disk)       ; ?s is smaller than ?l
    (current-step ?st - step)           ; which stage is active
    (next ?st1 - step ?st2 - step)      ; successor relation between steps
    (different ?p1 - peg ?p2 - peg)     ; distinct peg identifiers (true when p1 != p2)
  )

  ;; Move a top disk that is the sole disk on its source peg to an empty destination peg.
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-peg ?d ?p_src)
      (loc ?d ?p_src)
      (clear-disk ?d)
      (clear-peg ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?p_src))
      (on-peg ?d ?p_dest)

      (not (loc ?d ?p_src))
      (loc ?d ?p_dest)

      (clear-peg ?p_src)
      (not (clear-peg ?p_dest))

      ;; moved disk remains the top at destination
      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move a top disk that is on another disk (i.e., has a supporting disk below) to an empty destination peg.
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?b - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-disk ?d ?b)
      (loc ?d ?p_src)
      (loc ?b ?p_src)
      (clear-disk ?d)
      (clear-peg ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?b))
      (on-peg  ?d ?p_dest)

      (not (loc ?d ?p_src))
      (loc ?d ?p_dest)

      ;; the disk below becomes top on the source peg
      (clear-disk ?b)

      (not (clear-peg ?p_dest))

      ;; moved disk is top at destination
      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move a top disk that is the sole disk on its source peg onto a (larger) top disk at destination.
  (:action move_from_peg_to_disk
    :parameters (?d - disk ?p_src - peg ?p_dest - peg ?t - disk ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-peg ?d ?p_src)
      (loc ?d ?p_src)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (loc ?t ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?p_src))
      (on-disk ?d ?t)

      (not (loc ?d ?p_src))
      (loc ?d ?p_dest)

      (clear-peg ?p_src)
      (not (clear-disk ?t))

      ;; moved disk is top at destination
      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move a top disk that is on another disk onto a (larger) top disk at destination.
  (:action move_from_disk_to_disk
    :parameters (?d - disk ?b - disk ?t - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-disk ?d ?b)
      (loc ?d ?p_src)
      (loc ?b ?p_src)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (loc ?t ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?b))
      (on-disk ?d ?t)

      (not (loc ?d ?p_src))
      (loc ?d ?p_dest)

      ;; the disk below becomes top on the source peg
      (clear-disk ?b)
      (not (clear-disk ?t))

      ;; moved disk is top at destination
      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)