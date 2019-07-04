#include <QGuiApplication>
#include <QQmlApplicationEngine>

/**
 * @brief main - Program entry point
 *
 * @param argc - Number of arguments passed via command line
 * @param argv - Array of argument parameters
 * @return int - 0 if program exited gracefully, otherwise assume error
 */
int main(int argc, char *argv[])
{
    // Ensure high DPI displays (such as Mac retina displays) will scale the UI up to stay readable
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // Instantiate the Qt application we'll be piggybacking
    QGuiApplication app(argc, argv);

    // Load the UI
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    // Begin program loop
    return app.exec();
}
