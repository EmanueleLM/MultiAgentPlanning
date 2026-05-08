(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ; assumptions:
  ; - work hours monday 09:00-17:00 with 30-minute aligned slots (:00 and :30).
  ; - slot names encode their interval start_end using underscores.
  ; - busy tokens are taken directly from participants' private information (no aggregation shortcuts).

  (:objects
    s09_00_09_30   s09_30_10_00
    s10_00_10_30   s10_30_11_00
    s11_00_11_30   s11_30_12_00
    s12_00_12_30   s12_30_13_00
    s13_00_13_30   s13_30_14_00
    s14_00_14_30   s14_30_15_00
    s15_00_15_30   s15_30_16_00
    s16_00_16_30   s16_30_17_00
    - slot
  )

  (:init
    ;; busy intervals derived from participants' reported private information

    ;; diane busy: 09:00-09:30, 12:00-12:30, 14:30-15:30
    (busy diane s09_00_09_30)
    (busy diane s12_00_12_30)
    (busy diane s14_30_15_00)
    (busy diane s15_00_15_30)

    ;; kelly busy: 09:30-10:00, 10:30-11:00
    (busy kelly s09_30_10_00)
    (busy kelly s10_30_11_00)

    ;; deborah busy: 09:00-09:30, 10:00-14:00, 14:30-17:00
    (busy deborah s09_00_09_30)
    (busy deborah s10_00_10_30)
    (busy deborah s10_30_11_00)
    (busy deborah s11_00_11_30)
    (busy deborah s11_30_12_00)
    (busy deborah s12_00_12_30)
    (busy deborah s12_30_13_00)
    (busy deborah s13_00_13_30)
    (busy deborah s13_30_14_00)
    (busy deborah s14_30_15_00)
    (busy deborah s15_00_15_30)
    (busy deborah s15_30_16_00)
    (busy deborah s16_00_16_30)
    (busy deborah s16_30_17_00)
  )

  (:goal (and
    (meeting-scheduled)
    (scheduled-in-common)
  ))
)