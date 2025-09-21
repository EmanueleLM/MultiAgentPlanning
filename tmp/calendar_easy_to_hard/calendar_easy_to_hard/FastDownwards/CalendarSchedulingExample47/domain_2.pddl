(define (domain integrated-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants alice daniel scott lori cynthia jeffrey hannah - person)
  (:predicates
    (is-slot ?s - slot)
    (available ?p - person ?s - slot)
    (attends ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  (:action attend-alice
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (available alice ?s))
    :effect (attends alice ?s)
  )

  (:action attend-daniel
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (available daniel ?s))
    :effect (attends daniel ?s)
  )

  (:action attend-scott
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (available scott ?s))
    :effect (attends scott ?s)
  )

  (:action attend-lori
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (available lori ?s))
    :effect (attends lori ?s)
  )

  (:action attend-cynthia
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (available cynthia ?s))
    :effect (attends cynthia ?s)
  )

  (:action attend-jeffrey
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (available jeffrey ?s))
    :effect (attends jeffrey ?s)
  )

  (:action attend-hannah
    :parameters (?s - slot)
    :precondition (and (is-slot ?s) (available hannah ?s))
    :effect (attends hannah ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (is-slot ?s)
      (attends alice ?s)
      (attends daniel ?s)
      (attends scott ?s)
      (attends lori ?s)
      (attends cynthia ?s)
      (attends jeffrey ?s)
      (attends hannah ?s)
    )
    :effect (and (meeting-scheduled) (scheduled-at ?s))
  )
)