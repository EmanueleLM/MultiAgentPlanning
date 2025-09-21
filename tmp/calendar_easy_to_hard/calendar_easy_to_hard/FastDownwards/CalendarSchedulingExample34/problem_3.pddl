(define (problem orchestrate-meeting-monday)
  (:domain orchestrator-meeting)
  (:objects
    t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )
  (:init
    (slot t09_00) (slot t09_30) (slot t10_00) (slot t10_30)
    (slot t11_00) (slot t11_30) (slot t12_00) (slot t12_30)
    (slot t13_00) (slot t13_30) (slot t14_00) (slot t14_30)
    (slot t15_00) (slot t15_30) (slot t16_00) (slot t16_30)

    (work-time t09_00) (work-time t09_30) (work-time t10_00) (work-time t10_30)
    (work-time t11_00) (work-time t11_30) (work-time t12_00) (work-time t12_30)
    (work-time t13_00) (work-time t13_30) (work-time t14_00) (work-time t14_30)
    (work-time t15_00) (work-time t15_30) (work-time t16_00) (work-time t16_30)

    (day-monday t09_00) (day-monday t09_30) (day-monday t10_00) (day-monday t10_30)
    (day-monday t11_00) (day-monday t11_30) (day-monday t12_00) (day-monday t12_30)
    (day-monday t13_00) (day-monday t13_30) (day-monday t14_00) (day-monday t14_30)
    (day-monday t15_00) (day-monday t15_30) (day-monday t16_00) (day-monday t16_30)

    (available janice t09_00) (available janice t09_30) (available janice t10_00) (available janice t10_30)
    (available janice t11_00) (available janice t11_30) (available janice t12_00) (available janice t12_30)
    (available janice t13_00) (available janice t13_30) (available janice t14_00) (available janice t14_30)
    (available janice t15_00) (available janice t15_30) (available janice t16_00) (available janice t16_30)
    (preferred-janice t09_00) (preferred-janice t09_30) (preferred-janice t10_00) (preferred-janice t10_30)
    (preferred-janice t11_00) (preferred-janice t11_30) (preferred-janice t12_00) (preferred-janice t12_30)

    (available christine t09_00) (available christine t10_30) (available christine t11_00) (available christine t11_30)
    (available christine t12_30) (available christine t13_30) (available christine t14_00) (available christine t15_00)
    (available christine t15_30) (available christine t16_30)

    (available bobby t09_00) (available bobby t09_30) (available bobby t10_00) (available bobby t10_30)
    (available bobby t11_00) (available bobby t11_30) (available bobby t12_30)
    (available bobby t13_00) (available bobby t13_30) (available bobby t14_00)
    (available bobby t15_00) (available bobby t15_30) (available bobby t16_00) (available bobby t16_30)

    (available elizabeth t09_30) (available elizabeth t10_00) (available elizabeth t10_30) (available elizabeth t11_00)
    (available elizabeth t13_00) (available elizabeth t14_00) (available elizabeth t14_30) (available elizabeth t15_30)

    (available tyler t11_00) (available tyler t11_30) (available tyler t12_30) (available tyler t13_30)
    (available tyler t14_00) (available tyler t14_30) (available tyler t15_00) (available tyler t16_00)

    (available edward t09_30) (available edward t11_00) (available edward t14_00) (available edward t15_30)
  )
  (:goal (meeting-confirmed))
)