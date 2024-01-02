namespace :dev do

  DEFAULT_PASSWORD = 123456789

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando Administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando Usuário padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando Compilado padrão...") { %x(rails dev:add_default_exam) }
      show_spinner("Cadastrando Pergutas padrão...") { %x(rails dev:add_default_question) }
    else
      puts 'Ambiente de desenvolvimento não configurado.'
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      name: 'Administrator',
      email: 'admin@compiladosadmin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona o usuário padrão"
  task add_default_admin: :environment do
    User.create!(
      name: 'User',
      email: 'user@compiladosuser.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona compilado padrão"
  task add_default_exam: :environment do
    Exam.create!(
      name: 'Exam-test',
      university: 'Univesrty-test'
    )
  end

  desc "Adiciona pergutas padrão"
  task add_default_question: :environment do
    Question.create!(
      question_text: 'onde vc mora',
      answer: 'ali',
      exam_id: 1
    )
  end



  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
