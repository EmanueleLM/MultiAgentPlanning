(define (problem schedule-monday-combined)
  (:domain meeting-scheduling-combined)
  (:objects
    emily brian gerald julia logan judith michael - agent
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Emily available (busy: s09_00, s11_00, s14_00, s16_30)
    (available emily s09_30) (available emily s10_00) (available emily s10_30)
    (available emily s11_30) (available emily s12_00) (available emily s12_30)
    (available emily s13_00) (available emily s13_30) (available emily s14_30)
    (available emily s15_00) (available emily s15_30) (available emily s16_00)

    ;; Brian available (busy: s09_30, s14_30, s15_00, s16_30)
    (available brian s09_00) (available brian s10_00) (available brian s10_30)
    (available brian s11_00) (available brian s11_30) (available brian s12_00)
    (available brian s12_30) (available brian s13_00) (available brian s13_30)
    (available brian s14_00) (available brian s15_30) (available brian s16_00)

    ;; Gerald available (free entire day)
    (available gerald s09_00) (available gerald s09_30) (available gerald s10_00) (available gerald s10_30)
    (available gerald s11_00) (available gerald s11_30) (available gerald s12_00) (available gerald s12_30)
    (available gerald s13_00) (available gerald s13_30) (available gerald s14_00) (available gerald s14_30)
    (available gerald s15_00) (available gerald s15_30) (available gerald s16_00) (available gerald s16_30)

    ;; Julia available (free entire day)
    (available julia s09_00) (available julia s09_30) (available julia s10_00) (available julia s10_30)
    (available julia s11_00) (available julia s11_30) (available julia s12_00) (available julia s12_30)
    (available julia s13_00) (available julia s13_30) (available julia s14_00) (available julia s14_30)
    (available julia s15_00) (available julia s15_30) (available julia s16_00) (available julia s16_30)

    ;; Logan available (busy: s09_00,s09_30,s11_00,s11_30,s12_00,s12_30,s13_00,s13_30,s16_00,s16_30)
    (available logan s10_00) (available logan s10_30)
    (available logan s14_00) (available logan s14_30)
    (available logan s15_00) (available logan s15_30)

    ;; Judith available (busy: s09_00,s09_30,s10_00,s10_30,s11_30,s12_00,s15_00,s16_00,s16_30)
    (available judith s11_00) (available judith s12_30) (available judith s13_00)
    (available judith s13_30) (available judith s14_00) (available judith s14_30)
    (available judith s15_30)

    ;; Michael available (busy: s09_00,s10_00,s10_30,s11_30,s12_00,s13_00,s13_30,s14_00,s14_30,s15_00,s16_00,s16_30)
    (available michael s09_30) (available michael s11_00) (available michael s12_30) (available michael s15_30)
  )
  (:goal (meeting-scheduled))
)