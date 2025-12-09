(define (domain hanoi_multiagent)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg - place step)
  (:predicates
    ;; spatial / stack state
    (on ?d - disk ?p - place)        ; disk d is directly on place p (peg or disk)
    (clear ?p - place)               ; place p has nothing directly on it (is top)
    (holding ?d - disk)              ; mover is holding disk d
    ;; step control and sequencing
    (enabled ?s - step)              ; step is enabled (next to execute)
    (locked-step ?s - step)          ; locks for step are acquired
    (placed ?s - step)               ; the step has completed the place action
    (asserted-top ?s - step)         ; verifier asserted the top disk precondition for step
    (transported ?s - step)          ; transport phase completed for step
    (check-passed ?s - step)         ; auditor validated the placement for step
    ;; step metadata
    (step-from ?s - step ?p - peg)   ; source peg for step
    (step-to ?s - step ?p - peg)     ; target peg for step
    (step-next ?s1 - step ?s2 - step)
    ;; size relation (static)
    (larger ?x - disk ?y - disk)
  )

  ;; ---------------------------
  ;; Actions (multi-agent annotated)
  ;; ---------------------------

  ;; MOVER: acquire locks for the step
  (:action mover_lock
    :parameters (?s - step)
    :precondition (and (enabled ?s))
    :effect (and (locked-step ?s) (not (enabled ?s)))
  )

  ;; VERIFIER: assert that the disk to be picked is the top disk on source
  (:action verifier_assert_top
    :parameters (?s - step ?d - disk ?from - peg)
    :precondition (and (locked-step ?s) (step-from ?s ?from) (on ?d ?from) (clear ?d))
    :effect (and (asserted-top ?s))
  )

  ;; MOVER: pick the top disk from source
  (:action mover_pick
    :parameters (?s - step ?d - disk ?from - place)
    :precondition (and (locked-step ?s) (asserted-top ?s) (on ?d ?from) (clear ?d))
    :effect (and
      (holding ?d)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?d))
      (not (asserted-top ?s))
    )
  )

  ;; MOVER: transport (no structural state change, but enforces ordering)
  (:action mover_transport
    :parameters (?s - step ?d - disk)
    :precondition (and (locked-step ?s) (holding ?d))
    :effect (and (transported ?s))
  )

  ;; AUDITOR: validate placing on an empty target peg
  (:action auditor_check_place_empty
    :parameters (?s - step ?d - disk ?to - peg)
    :precondition (and (locked-step ?s) (transported ?s) (step-to ?s ?to) (clear ?to))
    :effect (and (check-passed ?s))
  )

  ;; AUDITOR: validate placing on a disk currently top-of-target
  (:action auditor_check_place_on
    :parameters (?s - step ?d - disk ?below - disk ?to - peg)
    :precondition (and (locked-step ?s) (transported ?s) (step-to ?s ?to) (on ?below ?to) (clear ?below) (larger ?below ?d))
    :effect (and (check-passed ?s))
  )

  ;; MOVER: place onto an empty peg
  (:action mover_place_on_empty
    :parameters (?s - step ?d - disk ?to - peg)
    :precondition (and (locked-step ?s) (holding ?d) (step-to ?s ?to) (check-passed ?s))
    :effect (and
      (on ?d ?to)
      (not (holding ?d))
      (not (clear ?to))
      (clear ?d)
      (placed ?s)
      (not (transported ?s))
      (not (check-passed ?s))
    )
  )

  ;; MOVER: place onto an existing top disk on a peg
  (:action mover_place_on_disk
    :parameters (?s - step ?d - disk ?below - disk ?to - peg)
    :precondition (and (locked-step ?s) (holding ?d) (step-to ?s ?to) (on ?below ?to) (clear ?below) (larger ?below ?d) (check-passed ?s))
    :effect (and
      (on ?d ?below)
      (not (holding ?d))
      (not (clear ?below))
      (clear ?d)
      (placed ?s)
      (not (transported ?s))
      (not (check-passed ?s))
    )
  )

  ;; AUDITOR: release locks and enable next step
  (:action auditor_unlock
    :parameters (?s - step ?next - step)
    :precondition (and (locked-step ?s) (placed ?s) (step-next ?s ?next))
    :effect (and (not (locked-step ?s)) (not (placed ?s)) (enabled ?next))
  )

  ;; Special final unlock (no next step) to release locks at the last step
  (:action auditor_unlock_final
    :parameters (?s - step)
    :precondition (and (locked-step ?s) (placed ?s) (not (step-next ?s ?s)))
    :effect (and (not (locked-step ?s)) (not (placed ?s)))
  )
)