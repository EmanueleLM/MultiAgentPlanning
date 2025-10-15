; NOTE: Replace the placeholders below with the actual participant names and availability facts.
; The domain above uses quantified preconditions to require that for a chosen slot every participant is available.
; To prioritize the earliest slot, list slot objects in chronological order in the :objects section (some planners
; prefer that ordering when multiple solutions exist). FastDownward will search and find a valid slot.

(define (problem meeting-mon-morning)
  (:domain meeting-scheduling)

  (:objects
    ; Replace these placeholders with real participant names, e.g. alice bob carol
    p1 p2 p3 - participant

    ; Define the 30-minute slots between 09:00 and 17:00 on Monday as objects.
    ; Keep them in chronological order to help the planner prefer earlier slots when multiple solutions exist.
    s-09:00 s-09:30 s-10:00 s-10:30 s-11:00 s-11:30 s-12:00 s-12:30
    s-13:00 s-13:30 s-14:00 s-14:30 s-15:00 s-15:30 s-16:00 s-16:30 - slot
  )

  (:init
    ; Declare participants and slots:
    (participant p1) (participant p2) (participant p3)

    (slot s-09:00) (slot s-09:30) (slot s-10:00) (slot s-10:30)
    (slot s-11:00) (slot s-11:30) (slot s-12:00) (slot s-12:30)
    (slot s-13:00) (slot s-13:30) (slot s-14:00) (slot s-14:30)
    (slot s-15:00) (slot s-15:30) (slot s-16:00) (slot s-16:30)

    ; AVAILABILITY FACTS GO HERE (replace these placeholders). Example:
    ; (available p1 s-09:00)
    ; (available p1 s-09:30)
    ; (available p2 s-09:30)
    ; (available p3 s-09:00)
    ; Do not add any (available ...) not present in the machine-readable inputs you supply.

    ; ------------------------
    ; Placeholder example (REMOVE or REPLACE with actual data):
    ; (available p1 s-09:00)
    ; (available p1 s-09:30)
    ; (available p2 s-09:30)
    ; (available p2 s-10:00)
    ; (available p3 s-09:00)
    ; (available p3 s-09:30)
    ; ------------------------

    ; Note: If a participant is NOT available at a slot, do NOT add (available participant slot).
    ; The schedule-meeting action requires (forall (?p - participant) (available ?p ?s)).
  )

  ; Goal: meeting scheduled (meeting-at some slot and scheduled)
  (:goal (scheduled))
)