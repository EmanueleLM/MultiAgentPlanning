(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent step)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)

    ;; no disk is on top of place ?p (peg or disk)
    (clear ?p - place)

    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; marks the legitimate acting agent
    (hanoi-player ?a - agent)

    ;; which discrete step is currently active
    (current-step ?s - step)

    ;; ordering of steps (discrete time)
    (step-successor ?s1 - step ?s2 - step)
  )

  ;; Move a top disk from some place (?under: disk or peg) onto an empty peg.
  (:action move-to-peg
    :parameters (?a - agent
                 ?d - disk
                 ?under - place
                 ?peg - peg
                 ?s - step
                 ?s2 - step)
    :precondition (and
      (hanoi-player ?a)
      (on ?d ?under)        ;; ?d is currently on ?under
      (clear ?d)            ;; ?d is the top disk of its pile
      (clear ?peg)          ;; target peg is empty (no top disk)
      (current-step ?s)
      (step-successor ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?peg)
      ;; the place that was under ?d becomes exposed / top
      (clear ?under)
      ;; target peg no longer empty
      (not (clear ?peg))
      ;; advance the discrete step
      (not (current-step ?s))
      (current-step ?s2)
    )
  )

  ;; Move a top disk from some place (?under: disk or peg) onto another disk (?target),
  ;; only allowed if the moved disk is smaller than the target disk and the target is top.
  (:action move-to-disk
    :parameters (?a - agent
                 ?d - disk
                 ?under - place
                 ?target - disk
                 ?s - step
                 ?s2 - step)
    :precondition (and
      (hanoi-player ?a)
      (on ?d ?under)        ;; ?d is currently on ?under
      (clear ?d)            ;; ?d is the top disk of its pile
      (clear ?target)       ;; target disk is top of its pile
      (smaller ?d ?target)  ;; cannot put larger on smaller
      (current-step ?s)
      (step-successor ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?target)
      ;; the place that was under ?d becomes exposed / top
      (clear ?under)
      ;; target disk no longer clear (it now has ?d on top)
      (not (clear ?target))
      ;; advance the discrete step
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)