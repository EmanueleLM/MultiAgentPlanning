(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  ;; Instance-specific person constants (kept in domain for clarity and to allow
  ;; action schemas to directly require each participant's availability).
  (:constants thomas dylan jerry - person)

  (:predicates
    ;; participant ?p is available for slot ?s
    (available ?p - person ?s - slot)
    ;; immediate successor relation between two half-hour slots
    (succ ?s1 - slot ?s2 - slot)
    ;; these two consecutive slots are already occupied by a scheduled meeting
    (occupied ?s1 - slot ?s2 - slot)
    ;; a meeting has been scheduled occupying these two slots
    (meeting_scheduled ?s1 - slot ?s2 - slot)
  )

  ;; Single action that schedules the one-hour meeting (two consecutive half-hour slots).
  ;; It requires the two slots to be consecutive, unoccupied, and available for all participants.
  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (succ ?s1 ?s2)
      (not (occupied ?s1 ?s2))

      ;; availability required for each participant for both half-hour slots
      (available thomas ?s1) (available thomas ?s2)
      (available dylan ?s1)  (available dylan ?s2)
      (available jerry ?s1)  (available jerry ?s2)
    )
    :effect (and
      (meeting_scheduled ?s1 ?s2)
      (occupied ?s1 ?s2)
    )
  )
)