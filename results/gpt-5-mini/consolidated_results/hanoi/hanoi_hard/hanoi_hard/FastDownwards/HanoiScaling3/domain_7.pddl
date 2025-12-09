(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent step)

  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)                  ; no disk is on top of place ?p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk)     ; disk ?d1 is smaller than disk ?d2
    (hanoi-player ?a - agent)           ; marks the legitimate acting agent
    (current-step ?s - step)            ; which step is currently active
    (step-successor ?s1 - step ?s2 - step) ; ordering of steps (discrete time)
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
      (clear ?d)            ;; ?d is top (nothing on it)
      (clear ?peg)          ;; target peg has no top disk (peg empty)
      (current-step ?s)
      (step-successor ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?peg)
      (clear ?under)        ;; whatever was under becomes exposed / top
      (not (clear ?peg))    ;; peg no longer empty / not clear
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
      (clear ?d)            ;; ?d is top (nothing on it)
      (clear ?target)       ;; target disk has no disk on top (is top)
      (smaller ?d ?target)  ;; size constraint: cannot put larger on smaller
      (current-step ?s)
      (step-successor ?s ?s2)
    )
    :effect (and
      (not (on ?d ?under))
      (on ?d ?target)
      (clear ?under)        ;; whatever was under becomes exposed / top
      (not (clear ?target)) ;; target no longer clear
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)