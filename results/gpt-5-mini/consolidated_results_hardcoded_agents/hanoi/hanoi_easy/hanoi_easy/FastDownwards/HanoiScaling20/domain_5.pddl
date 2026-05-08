(define (domain hanoi4_serial)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-disk ?d - disk ?below - disk)   ; ?d directly on top of disk ?below
    (on-peg  ?d - disk ?p - peg)        ; ?d directly on peg ?p (bottom disk of that peg)
    (loc     ?d - disk ?p - peg)        ; disk ?d is located on peg ?p (somewhere in the stack)
    (clear-disk ?d - disk)              ; no disk directly on ?d (i.e., ?d is top of its peg)
    (clear-peg  ?p - peg)               ; peg ?p has no disks on it (empty peg)
    (smaller ?s - disk ?l - disk)       ; ?s is smaller than ?l
    (current-step ?st - step)           ; which stage is active (exact stage token)
    (next ?st1 - step ?st2 - step)      ; successor relation between steps (linear ordering)
    (different ?p1 - peg ?p2 - peg)     ; distinct peg identifiers (enumerated in init)
  )

  ;; Move the single disk that is sole occupant on source peg to an empty destination peg.
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-peg ?d ?p_src)     ; disk is the bottom disk of source peg
      (loc ?d ?p_src)
      (clear-disk ?d)        ; and is also the top disk -> sole disk
      (clear-peg ?p_dest)    ; destination peg empty
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove from source peg and its location
      (not (on-peg ?d ?p_src))
      (not (loc ?d ?p_src))

      ;; source peg becomes empty
      (clear-peg ?p_src)

      ;; place disk as sole (bottom and top) on destination peg
      (on-peg ?d ?p_dest)
      (loc ?d ?p_dest)
      (not (clear-peg ?p_dest))

      ;; moved disk remains top at destination
      (clear-disk ?d)

      ;; advance step token
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move the top disk that sits on another disk at the source peg onto an empty destination peg.
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?b - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-disk ?d ?b)        ; ?d directly on top of ?b at source
      (loc ?d ?p_src)
      (loc ?b ?p_src)
      (clear-disk ?d)        ; top disk
      (clear-peg ?p_dest)    ; destination empty
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove support relation at source and remove location of moved disk
      (not (on-disk ?d ?b))
      (not (loc ?d ?p_src))

      ;; disk that was below becomes top on the source peg
      (clear-disk ?b)

      ;; place moved disk as sole/bottom on destination peg
      (on-peg ?d ?p_dest)
      (loc ?d ?p_dest)
      (not (clear-peg ?p_dest))

      ;; moved disk is top at destination
      (clear-disk ?d)

      ;; advance step token
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move the single disk that is sole occupant on source peg onto a larger top disk at destination.
  (:action move_from_peg_to_disk
    :parameters (?d - disk ?p_src - peg ?p_dest - peg ?t - disk ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-peg ?d ?p_src)     ; disk is bottom of source peg
      (loc ?d ?p_src)
      (clear-disk ?d)        ; and also top -> sole disk
      (clear-disk ?t)        ; destination top disk is clear
      (smaller ?d ?t)        ; moved disk smaller than destination top disk
      (loc ?t ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove from source peg and its loc
      (not (on-peg ?d ?p_src))
      (not (loc ?d ?p_src))

      ;; source peg becomes empty
      (clear-peg ?p_src)

      ;; place on top of destination disk
      (on-disk ?d ?t)
      (loc ?d ?p_dest)

      ;; destination top disk is no longer clear
      (not (clear-disk ?t))

      ;; moved disk becomes top at destination
      (clear-disk ?d)

      ;; advance step token
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move the top disk that sits on another disk at source onto a larger top disk at destination.
  (:action move_from_disk_to_disk
    :parameters (?d - disk ?b - disk ?t - disk ?p_src - peg ?p_dest - peg ?s - step ?s2 - step)
    :precondition (and
      (current-step ?s)
      (on-disk ?d ?b)        ; ?d directly on top of ?b at source
      (loc ?d ?p_src)
      (loc ?b ?p_src)
      (clear-disk ?d)        ; top disk
      (clear-disk ?t)        ; destination top disk is clear
      (smaller ?d ?t)        ; cannot place larger on smaller
      (loc ?t ?p_dest)
      (different ?p_src ?p_dest)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove relation with support at source and remove location of moved disk
      (not (on-disk ?d ?b))
      (not (loc ?d ?p_src))

      ;; disk below becomes top at source
      (clear-disk ?b)

      ;; place on top of destination disk
      (on-disk ?d ?t)
      (loc ?d ?p_dest)

      ;; destination top disk is no longer clear
      (not (clear-disk ?t))

      ;; moved disk becomes top at destination
      (clear-disk ?d)

      ;; advance step token
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)