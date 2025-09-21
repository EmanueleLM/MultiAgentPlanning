(define (problem orchestrated-meeting-monday)
  (:domain orchestrated-multiagent-scheduling)
  (:objects
    ; Monday 30-minute slots between 09:00 and 17:00 (last slot 16:30-17:00)
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    ; Global initial facts: meeting not yet scheduled.
    (meeting-not-scheduled)

    ; NOTE: Do NOT assume availability for any participant here.
    ; Paste the explicit availability and busy facts provided by each participant using the exact predicate names below.
    ; Example explicit facts (only include them if a participant actually provided them):
    ; (p1-available s09_00)
    ; (p1-available s09_30)
    ; (p1-busy s10_00)         ; if participant explicitly reported being busy at 10:00
    ;
    ; Repeat for p2, p3, ..., p7 using pX-available and pX-busy predicates.

    ; --- PLACEHOLDER: EXPLICIT AVAILABILITY/ BUSY FACTS FOR PARTICIPANTS ---
    ; Insert participant facts here exactly as supplied or translated to these canonical slot names.
    ;
    ; Important:
    ; - Do not add any pX-available or pX-busy facts that were not explicitly provided by participants.
    ; - If a participant did not provide any availability facts, do NOT add any facts for that participant (treated as unknown -> cannot assume available).
    ;
    ; Example block for a participant who explicitly reported availability at 09:00 and 09:30:
    ; (p1-available s09_00)
    ; (p1-available s09_30)
    ;
    ; Example block for a participant who explicitly reported being busy at 11:00:
    ; (p2-busy s11_00)
  )

  ; Goal: planner must have found and finalized a meeting (one slot satisfying all participants)
  (:goal (meeting-found))
)